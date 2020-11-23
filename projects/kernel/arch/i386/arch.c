
#include <kernel/arch.h>
#include <stdio.h>

void gdt_init();

void arch_init()
{
	puts("Initializing GDT...");
	gdt_init();
}
