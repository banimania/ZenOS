nasm -f bin boot_sector.asm -o boot_sector.bin
qemu-system-x86_64 boot_sector.bin
