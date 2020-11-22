#include <kernel/tty.h>
#include <string.h>

int puts(const char* string)
{
	terminal_writestring(string);
	terminal_putchar('\n');
	return 0;
}
