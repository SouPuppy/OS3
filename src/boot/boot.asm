[ORG 0x7C00]

    mov edi, 0x8000     ; memory address to start
    mov ecx, 0          ; starting sector number
    mov bl, 1           ; sectors to read

call read_disk

read_disk:
    pushad

    mov dx, 0x1F2
    mov al, bl
    out dx, al

    ; low 8
    mov al, cl
    inc dx              ; 0x1F4
    out dx, al

    ; middle 8
    shr ecx, 8
    mov al, cl
    inc dx              ; 0x1F4
    out dx, al

    ; high 8
    shr ecx, 8
    mov al, cl
    inc dx              ; 0x1F5
    out dx, al

    ; high 4
    shr ecx, 8
    and cl, 0xF
    inc dx              ; 0x1F6
    mov al, 0xE0
    or al, cl
    out dx, al

    inc dx
    mov al, 0x20
    
