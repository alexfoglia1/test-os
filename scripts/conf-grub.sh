. ./env-build.sh

echo "Configuring grub . . ."
if [ -d "isodir" ]; then
   echo "Clearing old grub files . . ."
   rm -fr isodir
fi

if [ -f $OSNAME ]; then
  echo "Cannot find $OSNAME.bin, aborting"
else
  echo "Creating isodir . . ."
  mkdir isodir
  mkdir isodir/boot
  mkdir isodir/boot/grub
  echo "Copying grub.cfg into isodir/boot/grub . . ."
  cp ../grub.cfg isodir/boot/grub/grub.cfg
  echo "Copying ${OSNAME}.bin into isodir/boot . . ."
  cp ${OSNAME}.bin isodir/boot/
  echo "Done! You can either launch install.sh to version the current files needed to build ${OSNAME}.iso in ../dist directory, or launch grub-mkrescue -o ${OSNAME}.iso isodir"
fi


