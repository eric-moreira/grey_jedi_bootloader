# Grey Jedi Bootloader

This is a simple x86 bootloader written in Assembly, created as a portfolio project to demonstrate low-level systems programming skills. The bootloader displays a custom message inspired by the "Grey Jedi" philosophy when booted in a virtual machine or on real hardware.

<img width="1512" alt="Captura de Tela 2025-06-30 às 23 36 40" src="https://github.com/user-attachments/assets/2dcbb887-63d0-4375-a348-8075942addea" />


## What does it do?
- Sets the video mode to 80x25 text mode
- Prints a stylized header and a list of "Grey Jedi" code lines to the screen
- Demonstrates direct hardware interaction using BIOS interrupts
- Fits entirely within a 512-byte boot sector

## Why?
This project is meant to show understanding of:
- x86 real mode Assembly
- BIOS interrupts (especially for text output)
- Boot sector structure and requirements
- How to create minimal, self-contained system software

## How to build and test
1. **Assemble the bootloader**
   ```sh
   nasm -f bin bootloader.asm -o bootloader.bin
   ```
2. **Test in an emulator** (like QEMU):
   ```sh
   qemu-system-x86_64 -hdi bootloader.bin
   ```
   Or use any other x86 emulator/virtual machine that supports booting from a raw binary.


## File overview
- `bootloader.asm`: The Assembly source code
- `bootloader.bin`: The compiled boot sector binary

## License
This project is public domain. Use it for learning, inspiration, or as a starting point for your own experiments.
