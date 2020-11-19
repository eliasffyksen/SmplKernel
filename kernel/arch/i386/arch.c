
#include <kernel/arch.h>
#include <stdio.h>

#include "gdt/gdt.h"

void arch_init()
{
	puts("Initializing GDT...");
	gdt_init();
	puts("Initialized GDT");
}
