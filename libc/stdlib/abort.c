#include <stdio.h>
#include <stdlib.h>

__attribute__((__noreturn__))
void abort()
{
#ifdef __is_libk
	// TODO: add proper kernel panic.
	printf("kernel: PANIC: ALL PRAISE THE LORD, AND RACE 4 THE EXITS!!! abort()\n");
#else
	// TODO: Abnormally terminate the process as if by SIGABRT.
	printf("ABORT, ABORT! PROCESS DOWN! abort()\n");
#endif
	while (1) ;
	__builtin_unreachable();
}
