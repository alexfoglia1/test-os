OSNAME=test-os
echo "Configuring $OSNAME build scripts . . ."
echo ""
TARGET=i686-elf
BUILDROOT="build-$OSNAME"
if [ ! -d "$BUILDROOT" ]; then
  echo "$BUILDROOT does not exists, creating it"
  mkdir "$BUILDROOT"
fi

echo "$TARGET-as ../src/boot.s -o boot.o" > $BUILDROOT/build.sh
echo "$TARGET-gcc -c ../src/kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra" >> $BUILDROOT/build.sh
echo "$TARGET-gcc -T ../src/linker.ld -o $OSNAME.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc" >> $BUILDROOT/build.sh

echo "mkdir -p isodir/boot/grub" > $BUILDROOT/conf-grub.sh
echo "cp $OSNAME.bin isodir/boot/$OSNAME.bin" >> $BUILDROOT/conf-grub.sh
echo "cp ../grub.cfg isodir/boot/grub/grub.cfg" >> $BUILDROOT/conf-grub.sh

echo "mkdir -p ../dist/" > $BUILDROOT/install.sh
echo "cp -r isodir ../dist/isodir" >> $BUILDROOT/install.sh

chmod +x $BUILDROOT/build.sh
chmod +x $BUILDROOT/conf-grub.sh
chmod +x $BUILDROOT/install.sh

echo "Done!"
echo ""

echo "To successfully compile $OSNAME you shall have $TARGET-as and $TARGET-gcc in your PATH"
echo "Run $BUILDROOT/build.sh to compile $OSNAME"
echo "Run $BUILDROOT/conf-grub.sh to configure grub to generate $OSNAME ISO"
echo "Run $BUILDROOT/install.sh to populate dist directory to generate $OSNAME ISO elsewhere"
echo "Run grub-mkrescue or other grub tools to generate $OSNAME ISO"
