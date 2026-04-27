#include "putchar.h"

unsigned short* video = (unsigned short*)0xB8000; // treat memory address like an array
int cursor = 0; // cursor starts at 0 to count where next letter goes

void putchar(char c) {
	video[cursor] = (unsigned short)c | (0x07 << 8); // write to screen
	cursor++; // update the cursor pos
}
