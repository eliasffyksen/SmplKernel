
#include <kernel/arch.h>
#include <stdio.h>

void arch_init()
{
	puts("Initializing GDT...");
	gdt_init();
}
