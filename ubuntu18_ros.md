##### 1. Install Google Chrome stable from a repo
- `wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -`
- `echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list`
- `sudo apt-get update` 
- `sudo apt-get install google-chrome-stable`

##### 2. Install ROS Kinetic
- `sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'`
- `sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116`
- `sudo apt-get update`
- `sudo apt install ros-melodic-desktop-full`
- `sudo rosdep init`
- `rosdep update`
- `echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc`
- `source ~/.bashrc`
- `sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential`

##### 3. Install additional tools
- `sudo apt-get install meld minicom ant git gitk openssh-server terminator gparted git-core python-argparse python-wstool python-vcstools build-essential gedit-plugins` 

#### 4. Extend length of History
- In the ~/.bashrc file change the below settings to lengthen the history file. Just add a couple zero’s to each setting.
- HISTSIZE=100000
- HISTFILESIZE=200000

#### 5. Modify Power Saving
- Go to System Settings -> Power -> Blank screen 
- Change to 'Never'
- Set "Turn screen off when inactive for: 1 hour"
- Set "Bluetooth" to off

#### 7. Edit Terminal's Default Profile
- Open Terminal. Click on Edit -> Profile Preferences -> Scrolling
- On the Scrolling tab, uncheck the box "Limit scrollback to:"

#### 8. GEDIT Preferences.
- Open a text file using Gedit or type `gedit` in a terminal window and hit enter. This brings up the text editor.
- Click Edit -> Preferences -> Editor. 
- Change Tab width to 4 , Check the box for "Insert spaces instead of tabs"
- Enable block commenting. Click Edit -> Preferences -> Plugins, and check the box for "Code Comment"
- Enable highlight matching brackets. Click Edit -> Preferences -> View, and check the box for "Highlight matching brackets"

#### 9. Allow user1 to dialout on USB devices
 - `sudo adduser user1 dialout`
 
#### 10. Setup git
- `git config --global user.email "user1@nuc01.com"`
- `git config --global user.name "User1 Nuc01"`
- `git config --global push.default simple`


