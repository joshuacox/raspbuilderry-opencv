#!/bin/bash
set -x
set +e
sudo apt-get -yqq build-dep opencv

export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -yqq \
  build-essential checkinstall cmake pkg-config yasm \
  git gfortran \
  libjpeg-dev \
  libpng-dev \
  libtiff-dev \
  libpt-dev \
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
  build-essential cmake \
  qt5-default libvtk6-dev \
  zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev \
  libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev \
  libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev \
  libtbb-dev libeigen3-dev \
  python-dev python-tk python-numpy python3-dev python3-tk python3-numpy \
  ant default-jdk \
  doxygen libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

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
cd
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
