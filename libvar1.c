#define LIB_NAME "The first library"

#include "libvar1.h"
#include <stdio.h>

int global_var = 1;

void print_gl_var_1(void)
{
	printf("%s: %d (addr: %p)\n", LIB_NAME, global_var, &global_var);
}
