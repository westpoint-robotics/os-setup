##### 0. Download and Install Ubuntu 22.04 LTS Jammy Jellyfish
- For Odroid XU4, Raspberry 3, or other 32-bit Arm processors - [Ubuntu MATE](https://ubuntu-mate.org/download/armhf/jammy/)
- For Intel NUC, or other 64-bit x86 processors - [Canonical Ubuntu Desktop](https://releases.ubuntu.com/22.04/)

##### 1. Install helper tools
- `sudo apt update && sudo apt upgrade -y`
- `sudo apt install terminator meld gedit gedit-plugins ant git gitk git-core git-doc openssh-server minicom gparted net-tools`

##### 2. Install [ROS2 Humble](https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html)
- After completing the steps outlined in the above ROS2 Docs, create your workspace:
- `echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc`
- `echo "export ROS_DOMAIN_ID=11" >> ~/.bashrc`
- `echo "export ROS_LOCALHOST_ONLY=0" >> ~/.bashrc`
- `mkdir -p ~/ros2_ws/src`
- `cd ~/ros2_ws/src`
- `git clone https://github.com/ros/ros_tutorials.git -b humble-devel`
- `cd ~/catkin_ws/`
- `rosdep install -i --from-path src --rosdistro humble -y`
- `sudo rosdep init`
- `rosdep update`
- `colcon build`
- `. install/setup.bash`

##### 3. Install helper tools
- `sudo apt update && sudo apt upgrade -y`
- `sudo apt install python3-vcstools ~nros-humble-rqt* sudo apt install ros-dev-tools python3-colcon-common-extensions`
- `echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc`
- `echo "export _colcon_cd_root=/opt/ros/humble/" >> ~/.bashrc`
- `echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc`

##### 4. Extend length of History
- In the ~/.bashrc file change the below settings to lengthen the history file. Just add a couple of zero’s to each setting.
- HISTSIZE=100000
- HISTFILESIZE=200000

##### 5. Edit Terminal's Default Profile
- Open Terminal. Click on Edit -> Profile Preferences -> Scrolling
- On the Scrolling tab, uncheck the box "Limit scrollback to:"

##### 6. GEdit Preferences.
- Open a text file using Gedit or type `gedit` in a terminal window and hit enter. This brings up the text editor.
- Click Edit -> Preferences -> Editor. 
- Change Tab width to 4 , Check the box for "Insert spaces instead of tabs"
- Enable block commenting. Click Edit -> Preferences -> Plugins, and check the box for "Code Comment"
- Enable highlight matching brackets. Click Edit -> Preferences -> View, and check the box for "Highlight matching brackets"

##### 7. Allow user to dialout on USB devices
 - `sudo adduser user1 dialout` OR `sudo adduser $USER dialout`
 
##### 8. Setup git
- `git config --global user.email "user1@nuc01.com"`
- `git config --global user.name "User1 Nuc01"`
- `git config --global push.default simple`

##### 9. Software Updates 
- 'System Settings ' -> 'Ubuntu Software' tab [[3]](https://help.ubuntu.com/community/Repositories/Ubuntu)
  - Check the top four boxes under 'Downloadable from the Internet': main, universe, restricted, multiverse.
- 'Updates tab'
  - Check te first two boxes: bionic-security and bionic-updates
  - 'Automatically check for updates: Never'
  - 'When there are security updates: Display Immediately'
  - 'When there are other updates: Display every two weeks'
  - 'Notify me of a new Ubuntu version: Never'

#### ----- Optional -----
##### Display Git-branch in command line prompt
- Copy and paste the following lines into the ~/.bashrc file
```
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
```

##### Install Google Chrome from command line (Only for 64-bit OS)
- `wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb`
- `sudo dpkg -i google-chrome-stable_current_amd64.deb`

##### Install Visual Studio Code
- `sudo apt update && sudo apt upgrade -y`
- `sudo apt install software-properties-common apt-transport-https wget -y`
- `wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg`
- `echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list`
- `sudo apt update`
- `sudo apt install code`

#### Install [Docker](https://docs.docker.com/engine/install/ubuntu/)
- After completing the steps outlined in the docs above, perform [Post-Installtion](https://docs.docker.com/engine/install/linux-postinstall/) configuration.
