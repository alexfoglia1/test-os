. ./env-build.sh

echo "Building multiboot section . . ."
if ! ${TARGET}-as ../src/boot.s -o boot.o; then
  echo "Error. Aborting"
  exit 1
else
  echo "Built boot.s"
fi


echo "Building kernel . . ."
if ! ${TARGET}-gcc -c ../src/kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra; then
  echo "Error. Aborting"
  exit 1
else
  echo "Built kernel.o"
fi
echo "Linking . . ."
if ! ${TARGET}-gcc -T ../src/linker.ld -o test-os.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc; then
  echo "Error. Aborting"
  exit 1
else
  echo "Built test-os.bin"
fi
echo "Done!"