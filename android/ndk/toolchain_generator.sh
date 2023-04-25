# Android Toolchain Generate

NDK_ROOT='android/'

$NDK_ROOT/build/tools/make-standalone-toolchain.sh --install-dir=android-toolchain.x86_64 --arch=x86_64
$NDK_ROOT/build/tools/make-standalone-toolchain.sh --install-dir=android-toolchain.x86 --arch=x86
$NDK_ROOT/build/tools/make-standalone-toolchain.sh --install-dir=android-toolchain.arm64 --arch=arm64
$NDK_ROOT/build/tools/make-standalone-toolchain.sh --install-dir=android-toolchain.arm --arch=arm