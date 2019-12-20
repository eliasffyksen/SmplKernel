#include <stdio.h>

#include <kernel/tty.h>
#include <kernel/arch.h>

void kernel_main() 
{
	
	terminal_initialize();
	puts("Terminal initialized");

	puts("\nInitializing arch...");
	arch_initialize();
	puts("Arch initialized ");

	puts("\nKernel initialized");
}
