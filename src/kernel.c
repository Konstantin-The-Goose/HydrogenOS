// whenever i try something new i like to comment every line so ignore all of them comments 

unsigned short* video = (unsigned short*)0xB8000; // treat memory address like an array
int cursor = 0; // cursor starts at 0 to count where next letter goes

void putchar(char c) {
	video[cursor] = (c | (0x07 << 8)); // write to screen
	cursor++; // update the cursor pos
}

void kernel_main() {
	putchar('t');
	putchar('o');
	putchar(' ');
	putchar('m');
	putchar('a');
	putchar('k');
	putchar('e');
	putchar(' ');
	putchar('a');
	putchar('p');
	putchar('p');
	putchar('l');
	putchar('e');
	putchar(' ');
	putchar('p');
	putchar('i');
	putchar('e');
	putchar(' ');
	putchar('f');
	putchar('r');
	putchar('o');
	putchar('m');
	putchar(' ');
	putchar('s');
	putchar('c');
	putchar('r');
	putchar('a');
	putchar('t');
	putchar('c');
	putchar('h');
	putchar(' ');
	putchar('u');
	putchar(' ');
	putchar('m');
	putchar('u');
	putchar('s');
	putchar('t');
	putchar(' ');
	putchar('f');
	putchar('i');
	putchar('r');
	putchar('s');
	putchar('t');
	putchar(' ');
	putchar('i');
	putchar('n');
	putchar('v');
	putchar('e');
	putchar('n');
	putchar('t');
	putchar(' ');
	putchar('t');
	putchar('h');
	putchar('e');
	putchar(' ');
	putchar('u');
	putchar('n');
	putchar('i');
	putchar('v');
	putchar('e');
	putchar('r');
	putchar('s');
	putchar('e');
  // thats what i call "efficient coding"
}

// AM I NOT TUFF AM I NOT TUFF

