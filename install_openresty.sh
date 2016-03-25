#! /bin/bash


OPENRESTY_VERSION="1.9.7.3"
OPENRESTY_DIR=$1


if [ -n "$OPENRESTY_DIR" ];then
	OPENRESTY_DIR="${OPENRESTY_DIR}" #add sub folder for lor
   echo "use defined install path: "${OPENRESTY_DIR}
else
   OPENRESTY_DIR="/opt/openresty"
   echo "use default install path: ${OPENRESTY_DIR}"
fi


#if [ "$LUA" == "lua5.1" ]; then
#	luarocks install LuaBitOp
#fi

wget https://openresty.org/download/openresty-$OPENRESTY_VERSION.tar.gz
tar xzvf openresty-$OPENRESTY_VERSION.tar.gz
cd openresty-$OPENRESTY_VERSION/

./configure --prefix="$OPENRESTY_DIR" --with-http_stub_status_module  --with-luajit

make
make install

${OPENRESTY_DIR}/nginx/sbin/nginx -v
echo "OpenResty installed."
