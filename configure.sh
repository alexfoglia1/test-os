. ./scripts/env-build.sh

if [ -d "build" ]; then
  echo "Erasing old build tree . . ."
  rm -fr build/*
else
  echo "Creating build tree . . ."
  mkdir build
fi

cp -r scripts/* ./build
chmod +x ./build/*

echo "Done! You can enter build directory and launch build.sh to compile ${OSNAME}"