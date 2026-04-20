org 0x7c00
bits 16

main:
    ; save boot drive
    mov [boot_drive], dl

    ; set segments
    xor ax, ax
    mov ds, ax
    mov es, ax

    ; stack
    mov ss, ax
    mov sp, 0x7c00

    ; load kernel to 0x1000
    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, [boot_drive]
    mov bx, 0x1000
    int 0x13
    jc disk_error

    ; jump to kernel
    jmp 0x0000:0x1000

disk_error:
    mov ah 0x0E
    mov al, 'E' ; efficient error handling 😭
    int 0x10
    jmp $

boot_drive db 0

times 510-($-$$) db 0
dw 0xAA55
