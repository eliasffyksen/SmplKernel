#include <stdio.h>
#include <stdlib.h>

__attribute__((__noreturn__))
void abort()
{
	puts("ABORT, ABORT! PROCESS DOWN! abort()\n");
	while (1) ;
	__builtin_unreachable();
}
