.intel_syntax noprefix

.globl gdt_load
.type gdt_load, @function
gdt_load:
	MOV EAX, [esp + 4]
	LGDT [EAX]
    JMP 0x08:selector_update

selector_update:
    MOV AX, 0x10
    MOV DS, AX
    MOV ES, AX
    MOV FS, AX
    MOV GS, AX
    MOV SS, AX
    RET