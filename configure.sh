#!/bin/bash
#set +e
source /usr/local/bin/virtualenvwrapper.sh
workon facecourse-py3
set -ex
cd
cd opencv
git checkout 3.3.1
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=/root/opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON ..
#cat /root/opencv/build/CMakeFiles/CMakeOutput.log
#cat /root/opencv/build/CMakeFiles/CMakeError.log
