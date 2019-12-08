/* Multiboot header constants */
.set ALIGN,	1<<0 # align on page boundaries
.set MEMINFO,	1<<1 # provide memory map
.set FLAGS,	ALIGN | MEMINFO
.set MAGIC,	0x1BADB002
.set CHECKSUM,	-(MAGIC + FLAGS)

.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

/* Allocate stack */
.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top:

/* Entry point */
.section .text
.global _start
.type _start, @function
_start:
	mov $stack_top, %esp # Init stack

	call kernel_main

	/* Infinite loop if nothing to do */
	cli
1:	hlt
	jmp 1b

.size _start, . - _start # Set size of _start
