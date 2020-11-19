
#ifndef ARCH_I386_GDT_H
#define ARCH_I386_GDT_H

#include <stdint.h>
#include <stddef.h>

struct GDT {
    uint32_t base;
    uint32_t limit;
    uint8_t type;
};
typedef uint64_t GDT_encoded;

struct GDT_ptr {
    uint16_t limit;
    GDT_encoded *base;
} __attribute__((packed));

void gdt_encode(GDT_encoded *gdt_target, struct GDT source);
void gdt_load(struct GDT_ptr*);
void gdt_init(void);

#endif