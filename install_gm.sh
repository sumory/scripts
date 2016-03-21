#!/bin/sh

wget http://sourceforge.net/projects/graphicsmagick/files/graphicsmagick/1.3.23/GraphicsMagick-1.3.23.tar.gz/download

mv download GraphicsMagick-1.3.23.tar.gz
tar zxvf GraphicsMagick-1.3.23.tar.gz
cd GraphicsMagick-1.3.23
./configure
make
make install
