#define LIB_NAME "The second library"

#include "libvar2.h"
#include <stdio.h>

int global_var = 2;

void print_gl_var_2(void)
{
	printf("%s: %d (addr: %p)\n", LIB_NAME, global_var, &global_var);
}
