print:
  pusha
  mov bx, PREFIX
  call print_raw
  popa

print_raw:
  pusha
  mov ah, 0x0e

print_loop:
  mov al, [bx]
  cmp al, 0
  je end_print
 
  int 0x10
  add bx, 1
  jmp print_loop

end_print:
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

PREFIX:
  dw '[ZenOS] ', 0
