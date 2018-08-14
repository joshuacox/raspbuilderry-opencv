#!/bin/bash
set -x
source /usr/local/bin/virtualenvwrapper.sh
workon facecourse-py3
set -ex
cd
cd opencv
git checkout 3.3.1
mkdir -p build
cd build
#make -j`nproc`
make -j32
sudo make install
sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

