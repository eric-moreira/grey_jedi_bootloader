[BITS 16]
[ORG 0x7C00]

start:
    ; Set video mode to 80x25 text
    mov ah, 0x00
    mov al, 0x03
    int 0x10

    ; Set SI to the beginning of the message list
    mov si, message
.print_loop:
    lodsb
    cmp al, 0
    je .done
    cmp al, 0x0A
    jne .print_char

    ; Newline: move to next line manually (simulate CRLF)
    mov ah, 0x0E
    mov al, 0x0D   ; carriage return
    int 0x10
    mov al, 0x0A   ; line feed
    int 0x10
    jmp .print_loop

.print_char:
    mov ah, 0x0E
    mov bh, 0x00
    mov bl, 0x07   ; light gray on black
    int 0x10
    jmp .print_loop

.done:
    jmp $

; ===========================
; Grey Jedi Code
; ===========================
message db "==========================================", 0x0A
        db "      Grey Jedi Bootloader v1.0", 0x0A
        db "==========================================", 0x0A
        db 0x0A
        db "1. There is no Dark Side, nor a Light Side. Only the Force.", 0x0A
        db "2. I will do what I must to keep the balance.", 0x0A
        db "3. There is no good without evil, but evil must not be allowed to flourish.", 0x0A
        db "4. I am a wielder of the flame, a champion of balance.", 0x0A
        db "5. I am the guardian of life and death.", 0x0A
        db "6. I am the protector of the Force.", 0x0A
        db 0

; Fill up to 510 bytes
times 510 - ($ - $$) db 0

; Boot sector magic number
dw 0xAA55
