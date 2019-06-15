## Instructions for installing Jupyter notebooks for use with ROS.  
###### NOTE 1: Much of ROS Kinetic relies on Python2 and these instructions are for Python2. If you wish to do this for Python3 add another set of instructions to the bottom. Python3 can work up until you run across a dependency on a library that only exists in Python2.  

###### NOTE 2: Use care with pip install. It has a tendency to cause version conflicts when installing libraries from both the Ubuntu repositories and Pip. This will lead to errors that say you can not import a library although that library is properly installed.

1. `sudo apt-get update && apt-get upgrade`  

1. `sudo apt-get -y install python-pip python-dev`  

1. `sudo -H pip2 install --upgrade pip`  

1. `sudo -H pip2 install jupyter`  

1. To start jupyter open a terminal and cd into a working directory then enter the command:  
`jupyter notebook`  

###### Note: In the top right corner under the "Logout" button is displayed the python version being used. It should be Python 2.



