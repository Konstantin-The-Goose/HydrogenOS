[org 0x7C00]
[bits 16]

start:
    ; Save boot drive
    mov [boot_drive], dl

    ; Setup segments
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

; load the tuff kernel
    mov ah, 0x02        ; BIOS read
    mov al, 10          ; sectors
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, [boot_drive]
    mov bx, 0x1000      ; load at 0x1000
    int 0x13
    jc disk_error

 ; enter protected mode (like a sigma)
    cli

    ; Enable A20 (fast way)
    in al, 0x92
    or al, 00000010b
    out 0x92, al

    ; Load GDT
    lgdt [gdt_descriptor]

    ; Set PE bit
    mov eax, cr0
    or eax, 1
    mov cr0, eax

    ; Far jump to 32-bit
    jmp 0x08:protected_mode

; 32 bit code bs
[bits 32]
protected_mode:
    ; Setup segments
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov fs, ax
    mov gs, ax

    ; Setup stack
    mov esp, 0x90000

    ; Jump to kernel
    jmp 0x1000

hang:
    jmp hang

; tuff error handling
[bits 16]
disk_error:
    mov ah, 0x0E
    mov al, 'E'
    int 0x10
    jmp $

boot_drive db 0

; gdt bs
gdt_start:
    dq 0x0000000000000000   ; null descriptor

gdt_code:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10011010b            ; code segment
    db 11001111b
    db 0x00

gdt_data:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10010010b            ; data segment
    db 11001111b
    db 0x00

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

times 510 - ($ - $$) db 0
dw 0xAA55
