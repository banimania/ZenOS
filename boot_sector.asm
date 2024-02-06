[org 0x7c00]
jmp skip_bpb
times 0x40 db 0

skip_bpb:

  xor ax, ax
  mov ds, ax
  cld

  mov bp, 0x7c00
  mov es, ax
  mov fs, ax
  mov gs, ax
  mov ss, ax
  mov sp, bp
  mov [BOOT_DISK], dl

  mov bx, INIT_MSG
  call print
  
  call print_newline

  jmp $

INIT_MSG:
  dw 'Bootloader initialized', 0

BOOT_DISK:
  db 0

%include "boot_sector_print.asm"

times 510-($-$$) db 0
dw 0xaa55
