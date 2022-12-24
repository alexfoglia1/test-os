OSNAME=test-os
echo "Configuring $OSNAME build"
TARGET=i686-elf
BUILDROOT="build-$OSNAME"
if [ ! -d "$BUILDROOT" ]; then
  echo "${BUILDROOT} does not exists, creating it"
  mkdir "${BUILDROOT}"
fi

echo "Installing build script in ${BUILDROOT}..."

echo "$TARGET-as ../boot.s -o boot.o" > $BUILDROOT/build.sh
echo "$TARGET-gcc -c ../kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra" >> $BUILDROOT/build.sh
echo "$TARGET-gcc -T linker.ld -o $OSNAME.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc" >> $BUILDROOT/build.sh
chmod +x $BUILDROOT/build.sh

echo "Build script created in ${BUILDROOT}/build.sh"
echo "To successfully compile ${OSNAME} you shall have $TARGET-as and $TARGET-gcc in your PATH"