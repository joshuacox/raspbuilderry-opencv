#!/bin/bash
set -e
sudo apt-get install -yqq \
  build-essential checkinstall cmake pkg-config yasm \
  git gfortran \
  libjpeg-dev \
  libpng-dev \
  libtiff-dev \
  libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev \
  libxine2-dev libv4l-dev \
  libgstreamer1.0-dev \
  qt5-default libgtk2.0-dev libtbb-dev \
  libatlas-base-dev \
  libmp3lame-dev libtheora-dev \
  libvorbis-dev libxvidcore-dev \
  libopencore-amrnb-dev libopencore-amrwb-dev \
  x264 v4l-utils \
  libprotobuf-dev protobuf-compiler \
  libgoogle-glog-dev libgflags-dev \
  python-dev python-pip python3-dev python3-pip \
  libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

#problematic packages
  # libfaac-dev 
  # libgstreamer-opencv1.0-0 \
  # libjasper-dev \
  # libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev \
  # libjpeg8-dev \

sudo -H pip2 install -U pip numpy
sudo -H pip3 install -U pip numpy

# Install virtual environment
sudo pip2 install virtualenv virtualenvwrapper
sudo pip3 install virtualenv virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh
#echo "# Virtual Environment Wrapper"  >> ~/.bashrc
#echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
#source ~/.bashrc

############ For Python 2 ############
# create virtual environment
mkvirtualenv facecourse-py2 -p python2
workon facecourse-py2

# now install python libraries within this virtual environment
pip install numpy scipy matplotlib scikit-image scikit-learn ipython

# quit virtual environment
deactivate
######################################

############ For Python 3 ############
# create virtual environment
mkvirtualenv facecourse-py3 -p python3
workon facecourse-py3

# now install python libraries within this virtual environment
pip install numpy scipy matplotlib scikit-image scikit-learn ipython

# quit virtual environment
deactivate
######################################

# opencv

#grab contrib first
#cd
if [ -e opencv_contrib ]; then
  echo 'already cloned opencv_contrib'
else
  git clone https://github.com/opencv/opencv_contrib.git
fi
cd opencv_contrib
git checkout 3.3.1
cd
if [ -e opencv ]; then
  echo 'already cloned opencv'
else
  git clone https://github.com/opencv/opencv.git
fi
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
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON ..
make -j`nproc`
sudo make install
sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
