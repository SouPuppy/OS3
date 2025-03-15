[ORG 0x7C00]

start:
  mov ax, 0x03
  int 0x10

  mov si, msg
  call print
  jmp $

print:
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
