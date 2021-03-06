
/*
References:
http://ktiml.mff.cuni.cz/~bartak/constraints/constrsat.html
https://github.com/srikumarks/FD.js

Core implementation ideas:

- compilable to JavaScript using Emscripten
- split into a kernel/backend in C and pre-processor/frontent in JS
- easy+efficient integration into higher-level language, by message passing
- operate only on binary constraints, compiling higher-level constraints

*/

#include <math.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "cstrain_declarations.h"

typedef int32_t VariableId;

typedef struct {
    int32_t cmd; // a Command
    int32_t a; // value or VariableId
    int32_t b; // value or VariableId
    int32_t c; // value or VariableId
} CommandData;

typedef struct {
    enum ConstraintType type;
    VariableId a;
    VariableId b;
} Constraint;

typedef struct {
    int32_t lower;
    int32_t upper;
} Domain;

typedef struct {
    Constraint *constraints;
    uint32_t n_constraints;
    uint32_t current_constraint;

    uint32_t n_variables;
    Domain *domains;
    int32_t *values;
} Solver;

static bool
check_constraint(int32_t *values, Constraint c)
{
    const VariableId a = c.a;
    const VariableId b = c.b;
    switch (c.type) {
    case CS_EQ:
        return values[a] == values[b];
    case CS_NEQ:
        return values[a] != values[b];
    case CS_LT:
        return values[a] < values[b];
    case CS_GT:
        return values[a] > values[b];
    case CS_LTE:
        return values[a] <= values[b];
    case CS_GTE:
        return values[a] >= values[b];
    default:
        return false;
    }
}

static bool
check_constraints(int32_t *values, Constraint *constraints, uint32_t n_constraints)
{
    for (int i=0; i<n_constraints; i++) {
        const bool pass = check_constraint(values, constraints[i]);
        if (!pass) {
            return false;
        }
    }
    return true;
}

void
solver_init(Solver *self)
{
    self->constraints = NULL;
    self->n_constraints = 0;
    self->current_constraint = 0;

    self->n_variables = 0;
    self->values = NULL;
    self->domains = NULL;
}

void
solver_destroy(Solver *self)
{
    if (self->constraints) {
        free(self->constraints);
        self->constraints = NULL;
    }
    if (self->values) {
        free(self->values);
        self->values = NULL;
    }
    if (self->domains) {
        free(self->domains);
        self->domains = NULL;
    }
}

void
print_values(int32_t *v, int n)
{
    for (int i=0; i<n; i++) {
        printf("%d|%d\n", i, v[i]);
    }
}

bool
next_world(Solver *self)
{
    for (int id=0; id<self->n_variables; id++) {
        const int32_t val = self->values[id];
        Domain d = self->domains[id];
        printf("checking var=%d, value=%d, domain=[%d, %d] \n", id, val, d.lower, d.upper);
        if (val < d.upper) {
            self->values[id] = val+1;
            return true;
        }
    }
    return false; // no more possible worlds
}

bool
solver_naive(Solver *self)
{
    int round = 0;
    while (true) {
        const bool more = next_world(self);
        const bool passed = check_constraints(self->values,
                self->constraints, self->n_constraints);
        printf("round=%d more=%s passed=%s\n",
                round, (more) ? "TRUE" : "FALSE", (passed) ? "TRUE" : "FALSE");
        round += 1;
        if (!more) break;
        if (passed) return true;
    }
    return false;
}

void
solver_parse_cmd(Solver *self, CommandData *data)
{
    if (data->cmd == CMD_HEADER) {
        printf("vars=%d, constraints=%d\n", data->a, data->b);
        self->n_variables = data->a;
        self->n_constraints = data->b;
        self->constraints = malloc(sizeof(int32_t)*self->n_constraints);
        self->values = malloc(sizeof(int32_t)*self->n_variables);
        self->domains = malloc(sizeof(int32_t)*self->n_variables);
    } else if (data->cmd == CMD_DECLARE) {
        printf("declared %d\n", data->a);
        // FIXME: check duplicate commands on same varid
//        const VariableId var = (data->a-1);
//        self->values[var] = data->b;
    } else if (data->cmd == CMD_DOMAIN) {
        // FIXME: check duplicate commands on same varid
        const VariableId var = (data->a - 1);
        printf("domain for %d is [%d, %d]\n", data->a, data->b, data->c);
        self->domains[var].lower = data->b;
        self->domains[var].upper = data->c;
    } else if (data->cmd >= CMD_EQ && data->cmd <= CMD_GTE) {
        // FIXME: check duplicate commands on same varid
        const enum ConstraintType type = (data->cmd - CMD_EQ);
        Constraint c = { type, (data->a-1), (data->b-1) };
        printf("constraint %s between %d and %d\n", constraint_names[c.type], c.a, c.b);
        self->constraints[self->current_constraint++] = c;
    } else {

    }
}

bool
solver_read_file(Solver *self, const char *fname)
{
    static const size_t CMD_SIZE = 4*4;
    unsigned char buffer[CMD_SIZE];
    FILE *f = fopen(fname, "rb");
    if (!f) { 
        return false;
    }
    size_t read = 0;
    do {
        read = fread(buffer, CMD_SIZE, 1, f);
        if (read) {
            CommandData* cmd = (CommandData *)(&buffer);
 //           printf("op=%d \n", cmd->cmd);
            solver_parse_cmd(self, cmd);
        }
    } while (read > 0);

    printf("read %zd bytes\n", read);
    fclose(f);
    return true;
}

void
write_cmd(FILE *f, CommandData *d)
{
    fwrite(d, sizeof(CommandData), 1, f);
}

// FIXME: write to stout
void
write_results(Solver *self, bool solved)
{
    // TODO: add number of iterations
    FILE *f = fopen("result.csp.bin", "wb");
    CommandData h = { CMD_RESULT, solved, self->n_variables, 0 };
    write_cmd(f, &h);
    for (int i=0; i<self->n_variables; i++) {
        CommandData r = { CMD_VALUE, (i+1), self->values[i], 0 };
        write_cmd(f, &r);
    }
    fclose(f);
}

int
main(int argc, char *argv[])
{ 
    if (argc != 2) {
        fprintf(stderr, "Expected 2 arguments\n");
        exit(1);
    }
    char *fname = argv[1];

    Solver solver;
    solver_init(&solver);

    printf("reading %s\n", fname);
    solver_read_file(&solver, fname);

    const bool solution_found = solver_naive(&solver);
    if (solution_found) {
        print_values(solver.values, solver.n_variables);
    }
    write_results(&solver, solution_found);

    solver_destroy(&solver);
}
