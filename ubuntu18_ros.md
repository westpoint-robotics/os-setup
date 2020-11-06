##### 1. Install Google Chrome stable from a repo
- `wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -`
- `echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list`
- `sudo apt-get update` 
- `sudo apt-get install google-chrome-stable`

##### 2. Install [ROS Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu)
- After completing the steps outlined in the above ROS Wiki, create your workspace:
- `mkdir -p ~/catkin_ws/src`
- `cd ~/catkin_ws/src`
- `catkin_init_workspace`
- `cd ~/catkin_ws/`
- `catkin_make`
- `echo "source $HOME/catkin_ws/devel/setup.bash" >> ~/.bashrc`
- `source $HOME/catkin_ws/devel/setup.bash`
- `rospack profile`

##### 3. Install additional tools
- `sudo apt-get install terminator meld gedit-plugins ant git gitk git-core git-doc openssh-server minicom gparted python-argparse python-vcstools`

#### 4. Extend length of History
- In the ~/.bashrc file change the below settings to lengthen the history file. Just add a couple zero’s to each setting.
- HISTSIZE=100000
- HISTFILESIZE=200000

#### 5. Modify Power Saving
- Go to System Settings -> Power -> Dim screen when inactive
- Change to 'OFF'
- -> Power -> Blank screen 
- Change to 'Never'
- -> Power -> Bluetooth"
- Change to 'OFF'
- -> Power -> Automatic Suspend
- Change to 'OFF'

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


