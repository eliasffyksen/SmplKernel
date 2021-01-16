
#include <kernel/arch.h>
#include <stdio.h>

void gdt_init(void);

void arch_init(void)
{
	puts("Initializing GDT...");
	gdt_init();
}
