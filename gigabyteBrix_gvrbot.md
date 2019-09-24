### These instructions are for the Gigabyte Brix with the GVRBot and can be used and assumes you have installed [Ubuntu 16.04 LTS](http://releases.ubuntu.com/16.04/)
----------------------------
#### 1. Install initial updates and important helper programs
- Connect to the internet.
- Use CTRL+ALT+T to open up a terminal window.
- Use the command `ping 8.8.8.8` to check whether you can connect to the Google servers (Great internet connection test)
- Refresh the package list: `sudo apt-get update`
- Install updates: `sudo apt-get upgrade`
- Install kernel updates: `sudo apt-get dist-upgrade`
- Install useful helper programs: `sudo apt-get install meld git terminator vim htop`
----------------------------
#### 2. Allow user1 to dialout on USB devices
 - `sudo adduser user1 dialout`
 - *REASON: This allows user1 to read and write to most serial devices such as USB. Most robotics projects require this.*
----------------------------
#### 3. Extend length of History
- In the ~/.bashrc file change the below settings to lengthen the history file. Just add a couple zero’s to each setting.
- HISTSIZE=100000
- HISTFILESIZE=200000
- *REASON: This makes it much easier to find what was done to the computer in the past. Many of the users on these systems are not familiar with Linux. The ability to search the terminal history for commands and the way it was done last semester has proven valuable, especially at the start of the semester. It has also allowed Faculty to figure out what the users have done on the computer for debugging problems. The long length has proven its value mostly when trying to recreate work done in the previous school year. This justifies a reminder that the work done on these computers is not private.*
----------------------------
#### 4. Disable bluetooth on start up
- `sudo gedit /etc/rc.local`
- Add this line before `exit 0`: rfkill block bluetooth
- You should still be able to enable Bluetooth through the top bar applet or System Settings.
- *REASON: We often do not require bluetooth and we rather conserve the battery. This can always be re-enabled through the desktop gui.*
----------------------------
#### 5. Install ROS Kinetic
- Follow instructions on the [ROS Wiki](http://wiki.ros.org/kinetic/Installation/Ubuntu) for a full-desktop install.
-----------------------------
#### 6. Install additional ROS tools
- `sudo apt-get install ros_kinetic_teleop_twist_joy`
-----------------------------
#### 7. Create catkin workspace
- `mkdir -p ~/catkin_ws/src`
- `cd ~/catkin_ws/src`
- `catkin_init_workspace`
- `cd ~/catkin_ws/`
- `catkin_make`
- `echo "source $HOME/catkin_ws/devel/setup.bash" >> ~/.bashrc`
- `source ~/.bashrc`
-----------------------------
#### 8. Create catkin workspace
- `mkdir -p ~/catkin_ws/src`
- `cd ~/catkin_ws/src`
- `catkin_init_workspace`
- `cd ~/catkin_ws/`
- `catkin_make`
- `echo "source $HOME/catkin_ws/devel/setup.bash" >> ~/.bashrc`
- `source ~/.bashrc`
-----------------------------
#### 9. Clone GVRBot code from github
- `cd ~/catkin_ws/src`
- `git clone https://github.com/westpoint-robotics/usma_gvrbot.git`
- `cd ~/catkin_ws/`
- `catkin_make`
- `source devel/setup.bash`
-----------------------------
#### 10. Connect to and drive around GVRBot
- [Follow these instructions](https://github.com/westpoint-robotics/usma_gvrbot/blob/master/linux_connect.md)
