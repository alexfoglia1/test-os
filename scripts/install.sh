./env-build.sh

echo "Exporting current install files . . ."
if [ ! -d "isodir" ]; then
  echo "Cannot find isodir. Aborting"
else
  if [ ! -d ../dist ]; then
    mkdir ../dist
  else
    echo "Erasing old installed files . . ."
    rm -fr ../dist
    mkdir ../dist
  fi
  cp -r isodir ../dist
  echo "Done!"
fi