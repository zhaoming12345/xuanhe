[BITS 16]
org 0x7c00

mov ax, cs
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7c00

mov ax, 0x0600
mov bx, 0x0700
mov cx, 0
mov dx, 0x184f
int 0x10

mov ax, 0x0200
mov bx, 0x0000
mov dx, 0x0000
int 0x10

times 510-($-$$) db 0
dw 0xaa55