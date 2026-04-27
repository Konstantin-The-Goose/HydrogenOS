#include "print.h"

void print(const char* str) {
    int i = 0;
    for (; str[i] != '\0'; i++) { // start at the first character of the string (int i = 0). then keep going until it hits the null terminator. after each loop, move to the next character (i++)
        putchar(str[i]);
    }
}
