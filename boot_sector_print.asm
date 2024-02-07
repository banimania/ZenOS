print:
  pusha
  mov cx, bx
  mov bx, PREFIX
  call print_raw
  mov bx, cx
  call print_raw
  popa
  ret

print_raw:
  pusha
  mov ah, 0x0e

print_loop:
  mov al, [bx]
  cmp al, 0
  je end_print_loop
  
  int 0x10

  add bx, 1

  jmp print_loop

end_print_loop:
  popa
  ret

print_newline:
  pusha
  mov ah, 0x0e
  mov al, 0x0a
  int 0x10
  mov al, 0x0d
  int 0x10
  popa
  ret

print_hex:
  pusha
  mov cx, 0

print_hex_loop:
  cmp cx, 4
  je end_print_hex_loop
  mov ax, dx
  and ax, 0x000f
  add al, 0x30
  cmp al, 0x39
  jle print_hex_loop_2
  add al, 7

print_hex_loop_2:
  mov bx, HEX + 5
  sub bx, cx
  mov [bx], al
  ror dx, 4
  add cx, 1
  jmp print_hex_loop

end_print_hex_loop:
  mov bx, HEX
  call print_raw
  popa
  ret

PREFIX:
  dw '[ZenOS] ', 0

HEX:
  dw '0x0000', 0
