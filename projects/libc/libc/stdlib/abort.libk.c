#include <stdio.h>

__attribute__((__noreturn__))
void abort()
{
	// TODO: add proper kernel panic.
	puts("kernel: PANIC: ALL PRAISE THE LORD, AND RACE 4 THE EXITS!!! abort()");
	while (1) ;
	__builtin_unreachable();
}
