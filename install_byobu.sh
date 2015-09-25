yum install screen

wget https://launchpad.net/byobu/trunk/5.57/+download/byobu_5.57.orig.tar.gz
tar -zxvf byobu_5.57.orig.tar.gz
cd byobu-5.57
./configure
make && make install
