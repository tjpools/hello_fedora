section .data
    hello_msg db "Hello, Fedora!", 0xA
    hello_len equ $ - hello_msg

section .bss
    rsp_buf resb 20

section .text
    global _start

_start:
    ; Write 'Hello, Fedora!' to stdout
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, hello_msg  ; pointer to message
    mov rdx, hello_len  ; message length
    syscall
    

    ; Print the value of rsp (stack pointer)
    mov rax, rsp        ; move rsp to rax
    mov rsi, rsp_buf    ; buffer for string
    call print_rsp_hex

    ; Exit
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; status 0
    syscall

print_rsp_hex:
    mov rcx, 16         ; 16 hex digits
    mov rbx, rsi        ; buffer pointer
    mov byte [rbx], '0'
    mov byte [rbx+1], 'x'
    mov rdx, rax        ; value to convert
    lea rsi, [rbx+2]    ; start writing after '0x'
.hex_loop:
        mov rax, rdx
        shr rax, 60         ; get highest nibble
        and rax, 0xF
        cmp rax, 9
        jbe .hex_num
        add rax, 87         ; 'a'-'f'
        jmp .hex_store
.hex_num:
        add rax, 48         ; '0'-'9'
.hex_store:
        mov byte [rsi], al
        inc rsi
        shl rdx, 4
        dec rcx
        jnz .hex_loop
    mov byte [rsi], 0xA ; newline
    inc rsi
    mov rax, 1          ; write syscall
    mov rdi, 1          ; stdout
    mov rdx, rsi        ; rsi points to end of buffer
    sub rdx, rbx        ; length = rsi - rbx
    mov rsi, rbx        ; buffer start ('0x...')
    syscall
    ret
