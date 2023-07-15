find . -name '*.h' -exec sed -i 's@#include <attr/xattr.h>@#include <sys/xattr.h>@g' {} \;
find . -name '*.c' -exec sed -i 's@#include <attr/xattr.h>@#include <sys/xattr.h>@g' {} \;

mkdir build
cd build

cmake ${CMAKE_ARGS} \
    -DCRYPTOPP_LIBRARIES="${PREFIX}/lib/libcryptopp${SHLIB_EXT}" \
    -DCRYPTOPP_INCLUDE_DIRS="${PREFIX}/include/cryptopp" \
    -DXROOTD_LOCATION="${PREFIX}" \
    -DPLUGIN_LFC=OFF \
    -DPLUGIN_RFIO=OFF \
    -DGTEST_LOCATION="${PREFIX}" \
    -DLIB_SUFFIX="" \
    ..

make -j${CPU_COUNT}
make install
