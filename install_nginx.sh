#!/bin/sh


DOWNLOAD_PATH="$1"
INSTALL_PATH="$2"


if [ -n "$DOWNLOAD_PATH" ];then
   	echo "use defined DOWNLOAD_PATH: "${DOWNLOAD_PATH}
else
	DEFAULT_DOWNLOAD_PATH=/data/downloads
   	echo "use default DOWNLOAD_PATH: $DEFAULT_DOWNLOAD_PATH"
   	DOWNLOAD_PATH=$DEFAULT_DOWNLOAD_PATH
fi

mkdir -p $DOWNLOAD_PATH


if [ -n "$INSTALL_PATH" ];then
   	echo "use defined INSTALL_PATH: "${INSTALL_PATH}
else
	DEFAULT_INSTALL_PATH=/data/server
   	echo "use default INSTALL_PATH: $DEFAULT_INSTALL_PATH"
   	INSTALL_PATH=$DEFAULT_INSTALL_PATH
fi

mkdir -p $INSTALL_PATH



cd $DOWNLOAD_PATH
wget http://nginx.org/download/nginx-1.9.5.tar.gz
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.37.tar.gz
wget http://www.openssl.org/source/openssl-0.9.8zg.tar.gz
wget http://zlib.net/zlib-1.2.8.tar.gz


tar zxvf nginx-1.9.5.tar.gz
tar zxvf pcre-8.37.tar.gz
tar zxvf openssl-0.9.8zg.tar.gz
tar zxvf zlib-1.2.8.tar.gz

yum install pcre-devel

cd nginx-1.9.5
mkdir -p $INSTALL_PATH/nginx-1.9.5
./configure --prefix=$INSTALL_PATH/nginx-1.9.5 --with-pcre=$DOWNLOAD_PATH/pcre-8.37 --with-zlib=$DOWNLOAD_PATH/zlib-1.2.8 --with-openssl=$DOWNLOAD_PATH/openssl-0.9.8zg

make && make install




