#!/usr/bin/env bash

# 0. Update Ubuntu
echo "0. Update Ubuntu"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# 1. Install Google Chrome stable from a repo
echo "Install Google Chrome stable from a repo"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get install -y google-chrome-stable

# 2. Install ROS Melodic
echo "2. Install ROS Melodic"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get update
sudo apt-get install -y ros-melodic-desktop-full
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential

# 3. Install additional tools
echo "3. Install additional tools"
sudo apt-get install -y meld minicom ant git gitk openssh-server terminator gparted git-core python-argparse python-wstool python-vcstools build-essential gedit-plugins dkms python-rosdep gedit-plugins
sudo rosdep init
rosdep update

# 9. Allow user1 to dialout on USB devices
echo "9. Allow user1 to dialout on USB devices"
sudo adduser user1 dialout

# 10. Setup git
echo "10. Setup git"
git config --global user.email "user1@panda01.com"
git config --global user.name "User1 panda01"
git config --global push.default simple

