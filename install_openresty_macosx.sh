#!/bin/bash


OPENRESTY_VERSION="1.11.2.1"
OPENRESTY_DIR=$1


if [ -n "$OPENRESTY_DIR" ];then
    OPENRESTY_DIR="${OPENRESTY_DIR}" #add sub folder for lor
   echo "use defined install path: "${OPENRESTY_DIR}
else
   OPENRESTY_DIR="/opt/openresty"
   echo "use default install path: ${OPENRESTY_DIR}"
fi


wget https://openresty.org/download/openresty-$OPENRESTY_VERSION.tar.gz
tar zxvf openresty-$OPENRESTY_VERSION.tar.gz
cd openresty-$OPENRESTY_VERSION

./configure \
            --with-cc-opt="-I/usr/local/Cellar/pcre/8.39/include -I/usr/local/opt/openssl/include" \
            --with-ld-opt="-L/usr/local/Cellar/pcre/8.39/lib -L/usr/local/opt/openssl/lib"  \
            -j8 \
            --with-http_stub_status_module \
            --with-luajit \
            --prefix="$OPENRESTY_DIR"
make
make install

${OPENRESTY_DIR}/nginx/sbin/nginx -v
echo "OpenResty installed."
