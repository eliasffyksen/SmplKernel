.section .text

gdt_table:
    .long 0x00000000, 0x00000000
    .long 0x0000FFFF, 0x00CF9A00
    .long 0x0000FFFF, 0x00CF9200
    .long 0x0000FFFF, 0x00CFFA00
    .long 0x0000FFFF, 0x00CFF200
gdt_ptr:
    .short 31
    .long gdt_table

.global gdt_init
.type gdt_init, @function

gdt_init:
    lea gdt_ptr, %eax
    lgdt (%eax)

    ljmp $0x08, $selector_update

selector_update:
    movw $0x10, %ax
    movw %ax, %ds
    movw %ax, %es
    movw %ax, %fs
    movw %ax, %gs
    movw %ax, %ss
    ret
