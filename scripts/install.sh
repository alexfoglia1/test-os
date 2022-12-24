./env-build.sh

if [ ! -d "isodir" ]; then
  echo "Cannot find isodir. Aborting"
else
  if [ ! -d ../dist ]; then
    mkdir ../dist
  fi
  if [ -d ../dist/isodir ]; then
    echo "Erasing old installed ISO . . ."
    rm -fr ../dist/*
  fi
  echo "Installing isodir in dist/isodir . . ." 
  cp -r isodir ../dist/isodir
  echo "Done!"
fi