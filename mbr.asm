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

mov ax, 0x1000
mov es, ax
mov bx, 0
mov ah, 0x02
mov al, 1
mov ch, 0
mov cl, 2
mov dh, 0
mov dl, 0x80
int 0x13

cli
mov ax, 0x1000
mov ds, ax
mov es, ax
mov fs, ax
mov gs, ax
mov ss, ax

lgdt [gdt_desc]

mov eax, cr0
or eax, 1
mov cr0, eax

jmp dword 0x08:0x10000

gdt:
    dq 0
    dq 0x00cf9a000000ffff
    dq 0x00cf92000000ffff

gdt_desc:
    dw $ - gdt - 1
    dd gdt

times 510-($-$$) db 0
dw 0xaa55