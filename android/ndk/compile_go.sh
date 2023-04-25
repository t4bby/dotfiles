GO="/usr/local/go/bin/go"

mkdir build/

arch=("x86" "x86_64" "arm64" "arm");
TOOLCHAIN_FOLDER=/root/dev/android-toolchain

for s in ${arch[@]}; do
  echo "build for $s"

  export GOOS=android
  export CGO_ENABLED=1


  if [ "$s" == "arm" ]; then
    export NDK_TOOLCHAIN=$TOOLCHAIN_FOLDER.arm
    export CC=$NDK_TOOLCHAIN/bin/arm-linux-androideabi-gcc
    export GOARCH=arm
    export GOARM=7
  elif [ "$s" == "x86" ]; then
    export NDK_TOOLCHAIN=$TOOLCHAIN_FOLDER.x86
    export CC=$NDK_TOOLCHAIN/bin/i686-linux-android-gcc
    export GOARCH=386
  elif [ "$s" == "x86_64" ]; then
    export NDK_TOOLCHAIN=$TOOLCHAIN_FOLDER.x86_64
    export CC=$NDK_TOOLCHAIN/bin/x86_64-linux-android-gcc
    export GOARCH=amd64
  elif [ "$s" == "arm64" ]; then
    export NDK_TOOLCHAIN=$TOOLCHAIN_FOLDER.arm64
    export CC=$NDK_TOOLCHAIN/bin/aarch64-linux-android-gcc
    export GOARCH=arm64
  fi

  $GO build -ldflags "-s -w" -o build/ main.go

done