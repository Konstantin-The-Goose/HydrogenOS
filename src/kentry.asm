bits 16 
org 0x1000

extern kernel_main
call kernel_main

jmp $
