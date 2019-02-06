##### 1. Install Google Chrome stable from a repo
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
sudo apt-get install google-chrome-stable

##### 2. Install ROS Kinetic
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

##### 3. Install additional tools
sudo apt-get install meld minicom ant git gitk gksu openssh-server terminator gparted git-core python-argparse python-wstool python-vcstools python-rosdep python-rosinstall python-rosinstall-generator build-essential

#### 4. Extend length of History
- In the ~/.bashrc file change the below settings to lengthen the history file. Just add a couple zero’s to each setting.
- HISTSIZE=100000
- HISTFILESIZE=200000

#### 5. Modify Power Saving
- Go to System Settings -> All Settings -> Brightness & Lock
- Check 'Dim screen to save power'
- Set "Turn screen off when inactive for: 1 hour"
- Disable screen lock

#### 6. Disable bluetooth on start up
- `gksu gedit /etc/rc.local`
- Add this line before `exit 0`: rfkill block bluetooth
- You should still be able to enable Bluetooth through the top bar applet or System Settings.

#### 7. Edit Terminal's Default Profile
- Open Terminal. Click on Edit -> Profile Preferences
- On the Scrolling tab, uncheck the box "Limit scrollback to:"

#### 8. GEDIT Preferences.
- Open a text file using Gedit or type `gedit` in a terminal window and hit enter. This brings up the text editor.
- Click Edit -> Preferences -> Editor. 
- Change Tab width to 4 , Check the box for "Insert spaces instead of tabs"

#### 9. Allow user1 to dialout on USB devices
 - `sudo adduser user1 dialout`
 
#### 10. Setup git
- `git config --global user.email "user1@brix01.com"`
- `git config --global user.name "User1 Brix"`
- `git config --global push.default simple`


