[ORG 0x7C00]

read_disk:
  mov bx, 0x8000
  mov cx, 0x01
  mov ax, 0x201
  mov dx, 0x80
  int 0x13
  jc read_disk
  
  xchg bx, bx

start:
  mov ax, 0x03
  int 0x10

  mov si, msg
  call print
  jmp $

print:

  xchg bx, bx
  mov ah, 0x0e
  .nc:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .nc
  .done:
    ret

halt:
  hlt

  msg db 'Hello World'

  times 510 - ($ - $$) db 0
  dw 0xAA55
