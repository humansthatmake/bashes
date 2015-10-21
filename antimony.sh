#!/bin/bash
echo "The script starts now..."

cd ~/Desktop/
wget http://download.qt.io/archive/qt/5.4/5.4.0/qt-opensource-linux-x64-5.4.0.run
sudo chmod +x qt-opensource-linux-x64-5.4.0.run
sudo ./qt-opensource-linux-x64-5.4.0.run
rm qt-opensource-linux-x64-5.4.0.run

sudo apt-get install -y build-essential libpng-dev python3-dev libboost-all-dev libgl1-mesa-dev lemon flex git

git clone https://github.com/mkeeter/antimony
sudo mv -v antimony /opt/
cd /opt/antimony/
mkdir build
cd /opt/antimony/build
/opt/Qt5.4.0/5.4/gcc_64/bin/qmake ../sb.pro
make -j8

sudo ln -s /opt/antimony/build/app/antimony /usr/local/bin/antimony
antimony
