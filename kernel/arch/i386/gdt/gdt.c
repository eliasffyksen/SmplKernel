
#include "gdt.h"

static struct GDT_ptr gdt_ptr;
static GDT_encoded gdt_table[5];

void gdt_encode(GDT_encoded *gdt_target, struct GDT source)
{
    uint8_t *target = (uint8_t *) gdt_target;

    // Check the limit to make sure that it can be encoded
    if ((source.limit > 65536) && ((source.limit & 0xFFF) != 0xFFF)) {
        puts("ERR: Invalid gdt limit");
        return;
    }
    if (source.limit > 65536) {
        // Adjust granularity if required
        source.limit = source.limit >> 12;
        target[6] = 0xC0;
    } else {
        target[6] = 0x40;
    }

    // Encode the limit
    target[0] = source.limit & 0xFF;
    target[1] = (source.limit >> 8) & 0xFF;
    target[6] |= (source.limit >> 16) & 0xF;
 
    // Encode the base 
    target[2] = source.base & 0xFF;
    target[3] = (source.base >> 8) & 0xFF;
    target[4] = (source.base >> 16) & 0xFF;
    target[7] = (source.base >> 24) & 0xFF;
 
    // And... Type
    target[5] = source.type;
}

void gdt_init(void)
{
    gdt_ptr.limit = sizeof(gdt_table) - 1;
    gdt_ptr.base = &gdt_table;

    gdt_encode(&gdt_table[0], (struct GDT) {.base = 0, .limit = 0, .type=0});
    gdt_encode(&gdt_table[1], (struct GDT) {.base = 0, .limit = 0xFFFFFF, .type=0x9A});
    gdt_encode(&gdt_table[2], (struct GDT) {.base = 0, .limit = 0xFFFFFF, .type=0x92});
    gdt_encode(&gdt_table[3], (struct GDT) {.base = 0, .limit = 0xFFFFFF, .type=0xFA});
    gdt_encode(&gdt_table[4], (struct GDT) {.base = 0, .limit = 0xFFFFFF, .type=0xF2});

    gdt_load(&gdt_ptr);
}