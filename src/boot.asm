org 0x7c00 ; bios loads the code at this address 
bits 16 

main: 
	; set up data segments
	mov ax, 0 ; cant write to ds/es directly
	mov ds, ax
	mov es, ax

	; set up stack
	mov ss, ax
	mov sp, 0x7c00

	; load kernel (1 sector after bootloader)
	 mov ah, 0x02        ; BIOS read
	 mov al, 1           ; number of sectors
	 mov ch, 0           ; cylinder
	 mov cl, 2           ; sector (1 = bootloader, so kernel = 2)
	 mov dh, 0           ; head
	 mov dl, 0x80        ; drive (hard disk)
	 mov bx, 0x1000      ; load address
	 int 0x13            ; BIOS disk read
	 jmp 0x0000:0x1000   ; jump to kernel

hang:
	jmp hang	

times 510-($-$$) db 0 ; gives size of the program (in bytes)
dw 0xAA55 

; cant wait to be free from ts and write a kernel in c

