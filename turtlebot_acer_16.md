### These instructions are for the turtlebot's Acer Aspire E11 laptop and assumes you are starting from Ubuntu 16.04 LTS

#### 1. Instal helper applications and software
- `sudo apt-get install meld minicom ant git gitk gksu openssh-server terminator gparted`
----------------------------
#### 2. Install the classical looking desktop session and switch to Metacity on logon:
- `sudo apt-get install gnome-session-flashback`
- Then logout, on the login screen click the Ubuntu icon and switch to metacity, log back in.
- Add icons to the top panel by left-click, drag and drop. Typically do this for Terminal, Gedit, Firefox.
- *REASON: Many Cadets dislike the learning curve associated with unfamiliar UI of Unity. They can easily transition to using the classical desktop environment. The enhancements offered by Unity provide no value to our projects.*
----------------------------
#### 3. Extend length of History
- In the ~/.bashrc file change the below settings to lengthen the history file. Just add a couple zero’s to each setting.
- HISTSIZE=100000
- HISTFILESIZE=200000
- *REASON: This makes it much easier to find what was done to the computer in the past. Many of the users on these systems are not familiar with Linux. The ability to search the terminal history for commands and the way it was done last semester has proven valuable, especially at the start of the semester. It has also allowed Faculty to figure out what the users have done on the computer for debugging problems. The long length has proven its value mostly when trying to recreate work done in the previous school year. This justifies a reminder that the work done on these computers is not private.*
----------------------------
#### 4. Modify Power Saving
- Go to System Settings -> All Settings -> Brightness & Lock
- Check 'Dim screen to save power'
- Set "Turn screen off when inactive for: 1 hour"
- Disable screen lock
- *REASON: Almost always, these laptops are placed on the turtlebots and may not connected to a power source. Hence the need to conserve battery. The auto-lock is more of an inconvenience and may cause errors while in the midst of a critical operation.*
----------------------------
#### 5. Disable bluetooth on start up
- `gksu gedit /etc/rc.local`
- Add this line before `exit 0`: rfkill block bluetooth
- You should still be able to enable Bluetooth through the top bar applet or System Settings.
- *REASON: We often do not require bluetooth and we rather conserve the battery. This can always be re-enabled through the desktop gui.*
----------------------------
#### 6. Edit Terminal's Default Profile
- Open Terminal. Click on Edit -> Profile Preferences
- On the Scrolling tab, uncheck the box "Limit scrollback to:"
- *REASON: Many times the output to the terminal sent by a build command exceeds this limit. To understand build problems, many times you need to scroll to the beginning of the output. This enables you to scroll back to the beginning of the buffer.*
----------------------------
#### 7. GEDIT Preferences.
- Open a text file using Gedit or type `gedit` in a terminal window and hit enter. This brings up the text editor.
- Click Edit -> Preferences -> Editor. 
- Change Tab width to 4 , Check the box for "Insert spaces instead of tabs"
- *REASON: The default 8 spaces per tab makes reading source code difficult. 4 spaces is an acceptable convention used by industry. Changing tabs to spaces as a convention is helpful when programming in Python or any other language that relies on indentation.*
----------------------------
#### 8. Firefox Preferences 
- Under Preferences -> Privacy -> History, select "Never remember history".
- *REASON: With everyone using a common login name, this reduces the likelihood that a person remains logged in to a website in Firefox after closing Firefox. This prevents the problem of opening Firefox and navigating to Gmail to find someone else's email account is already logged on. The Cadets should be told these computers are not for personal usage and that they should not expect privacy on these computers. Logging into personal online accounts is acceptable but they need to be aware of the limits to their privacy.*
----------------------------
#### 9. Scroll bars on the side of windows
- Type this in the terminal to get the scroll bars to appear:
- `gsettings set com.canonical.desktop.interface scrollbar-mode normal`
- *REASON: This are the more familiar scrollbars and make the UI behave as many Cadets would expect it.*
----------------------------
#### 10. Allow user1 to dialout on USB devices
 - `sudo adduser user1 dialout`
 - *REASON: This allows user1 to read and write to most serial devices such as USB. Most robotics projects require this.*
 ----------------------------
#### 11. Disable automatic updates
- System Settings -> Software & Updates -> Updates
- Uncheck 'Unsupported updates'
- Set 'Automatically check for updates: Never'
- Set 'When there are other updates: Display every two weeks'
- *REASON: Certain unsupported updates cause unwarranted errors and discrepancies. The cadets usually wont track the updates they've applied. Its best for the system admin (OIC/RRC/CSG) to manually update the laptop before handing out to cadets. Cadets can always use `sudo apt-get update` if requrired.*
----------------------------
#### 12. Install ROS Kinetic Kame
- Follow instructions on the [ROS Wiki](http://wiki.ros.org/kinetic/Installation/Ubuntu) for a full-desktop install.
-----------------------------
#### 13. Install additional tools
- `sudo apt-get install git-core python-argparse python-wstool python-vcstools python-rosdep ros-kinetic-control-msgs ros-kinetic-joystick-drivers`
-----------------------------
#### 14. Create catkin workspace
- `mkdir -p ~/catkin_ws/src`
- `cd ~/catkin_ws/src`
- `catkin_init_workspace`
- `cd ~/catkin_ws/`
- `catkin_make`
- `echo "source $HOME/catkin_ws/devel/setup.bash" >> ~/.bashrc`
- `source $HOME/catkin_ws/devel/setup.bash`
- `rospack profile`
-----------------------------
#### 15. Turtlebot
- `sudo apt-get install ros-kinetic-turtlebot*`
- If the above command does not work, follow installation instructions provided in [this tutorial](http://wiki.ros.org/turtlebot/Tutorials/kinetic/Turtlebot%20Installation). These commands were framed for kinetic. Hence you'll have to change the distro names in all the commands to 'kinetic'.
----------------------------
### 16. Environmental variables that must be set for minimal.launch to run.
- `export TURTLEBOT_BASE=kobuki`
- `export TURTLEBOT_BATTERY="/sys/class/power_supply/BAT1"`
- `export TURTLEBOT_STACKS=hexagons`
- `export TURTLEBOT_3D_SENSOR=astra`
- `export TURTLEBOT_SIMULATION=false`
- `export TURTLEBOT_STACKS=hexagons`
- `export TURTLEBOT_SERIAL_PORT=/dev/kobuki`
-----------------------------
#### 17. Turtlebot Player Stage Gazebo (Optional)
- Copy the map files to ~/stage by:
 - `mkdir ~/stage`
 - `cp -Rf /opt/ros/kinetic/share/turtlebot_stage/maps/ ~/stage/maps/`
 - `mkdir ~/gazebo`
 - `cp -Rf /opt/ros/kinetic/share/turtlebot_gazebo/worlds/ ~/gazebo/worlds`
- `export TURTLEBOT_STAGE_MAP_FILE=~/stage/maps/maze.yaml`
- `export TURTLEBOT_STAGE_WORLD_FILE=~/stage/maps/stage/maze.world`
- `export TURTLEBOT_GAZEBO_WORLD_FILE=~/gazebo/worlds/playground.world`
- To run player stage 2d simultation: `roslaunch turtlebot_stage turtlebot_in_stage.launch`
- To run gazebo 3d simulation, after stopping all the 2d processess: 
 - `roslaunch turtlebot_gazebo turtlebot_world.launch`
 - `roslaunch turtlebot_rviz_launchers view_robot.launch`
 - `roslaunch turtlebot_teleop xbox360_teleop.launch`
