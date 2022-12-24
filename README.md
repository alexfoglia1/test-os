# test-os

This is my osdev tutorial [Bare Bones](https://wiki.osdev.org/Bare_Bones) result.

## What is implemented

Minimal multiboot section calling a monolithic kernel main.
The kernel writes to screen 36 rows:

    Hello, kernel <n>

Where n is a character from '0' to 'Z'.
Terminal scrolling and new lines are implemented.

## How to build it

    git clone https://github.com/alexfoglia1/test-os.git
    cd test-os.git
    ./configure.sh
    cd build
    ./build.sh

Note that i686 assembler, linker and compiler are required to be present in PATH.
    
## How to generate iso

Starting from the post-build condition described above, one can:

    ./conf-grub.sh

If grub-mkrescue is available in environment:

    grub-mkrescue -o test-os.iso isodir

Or

    ./install.sh

And copy the "dist" directory inside another envirnoment and then launch grub-mkrescue in the dist folder. (Useful in case of Cygwin is used : grub-mkrescue is no longer supported).

## How to use it

Create a x86 virtual machine (e.g. VirtualBox, QEMU, VmWare) and assign the test-os.iso as the bootable media of the newly created virtual machine.
Last generated iso image is available in dist subfolder.





