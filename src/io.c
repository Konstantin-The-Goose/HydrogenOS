// reads a byte from the hardware IO port 
// "port" is the hardware port number (like 0x60 for keyboard input)
unsigned char inb(unsigned short port)
{
    unsigned char result;
    __asm__ __volatile__("inb %1, %0"
                        : "=a" (result)
                        : "Nd" (port)); 
    return result;
}

// I BARELY UNDERSTAND WHAT I WROTE HOLY FUCK BRO IM SO SHIT AT WRITING WRAPPERS
// at least it works (hopefully) and i wont touch it again
