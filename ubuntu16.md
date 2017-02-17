## For Ubuntu 16.04 LTS 

Below are the setup instructions to follow once you have a clean install of Ubuntu 16.04 

#### 1. Modify and Update grub
- `sudo nano /etc/default/grub`
- Modify the line GRUB_CMDLINE_LINUX_DEFAULT = "quiet splash intel_idle.max_cstate=1"
- `sudo update-grub`
- `sudo reboot`
- *REASON: This is to prevent the screen from freezing after a few minutes of inactivity. This problem was faced multiple times during installation and the computer had to be hard rebooted in order to recover. This seems to be a major bug affecting multiple users of 15.10 and 16.04 and Ubuntu is working to resolve it.* 

#### 2. Install the classical looking desktop session and switch to Metacity on logon:
- `sudo apt-get install gnome-session-flashback`
- Then logout, on the login screen click the Ubuntu icon and switch to metacity, log back in.
- Add icons to the top panel by left-click, drag and drop. Typically do this for Terminal, Gedit, Firefox.
- *REASON: Many Cadets dislike the learning curve associated with unfamiliar UI of Unity. They can easily transition to using the classical desktop environment. The enhancements offered by Unity provide no value to our projects.*

#### 3. Instal helper applications
- `sudo apt-get install meld minicom ant git-core gksu openssh-server`

#### 4. Change computer name (If the computer name and user name are not already set to the below values):
- `gksu gedit /etc/hosts`
- `gksu gedit /etc/hostname`
- Change computer name to roslabxx where xx is the laptop number
- Set user to 'user1'
- Assign a password as per the prevailing EECS convention.
- *REASON: This computer naming convention removed much confusion over computer behavior while communicating over the network and with Robots. The common user name and password has significantly simplified the problem of working on multiple computers. It makes having discussion about "user space" vs "system space" much more clear and easier to relate to material taught in the curriculum.*  

#### 5. Extend length of History
- In the ~/.bashrc file change the below settings to lengthen the history file. Just add a couple zero’s to each setting.
- HISTSIZE=100000
- HISTFILESIZE=200000
- * REASON: This makes it much easier to find what was done to the computer in the past. Many of the users on these systems are not familiar with Linux. The ability to search the terminal history for commands and the way it was done last semester has proven valuable, especially at the start of the semester. It has also allowed Faculty to figure out what the users have done on the computer for debugging problems. The long length has proven its value mostly when trying to recreate work done in the previous school year. This justifies a reminder that the work done on these computers is not private.* 	

#### 6. Disable Power Saving
- Go to System Settings -> All Settings -> Brightness & Lock
- Click on the padlock to unlock
- Disabled "Dim screen to save power"
- Set "Turn screen off when inactive for:"

#### 7. Edit Terminal's Default Profile
- On the Scrolling tab, check box for "Unlimited scrolling"
- *REASON: Many times the output to the terminal sent by a build command exceeds this limit. To understand build problems, many times you need to scroll to the beginning of the output. This enables you to scroll back to the beginning of the buffer.*

#### 8. GEDIT Preferences.
- Open a text file using Gedit 
- Under Preferences -> Editor: Change Tab width to 4 , Check the box for "Insert spaces instead of tabs"
- *REASON: The default 8 spaces per tab makes reading source code difficult. 4 spaces is an acceptable convention used by industry. Changing tabs to spaces as a convention is helpful when programming in Python or any other language that relies on indentation.*

#### 9. Allow user1 to dialout on USB devices
 - `sudo adduser user1 dialout`
 - *REASON: This allows user1 to read and write to most serial devices such as USB. Most robotics projects require this.*

#### 10. Create 'cls' command 
- In order to have a quick way to clear the screen add the below line to ~/.bashrc 
- alias cls='printf "\033c"'
- *REASON: Commonly when you build a large application a lot of output is sent to the terminal. It can be difficult to tell when your last build output stopped and the new build began. The 'cls' alias clears the screen and the buffer (unlike the Linux "clear" command). Running 'cls' before a new build allows you to scroll to the top of the buffer to find the start of the output for this build. This is in honor to the old MS-DOS command 'cls' that behaved this way. Having 'cls' on Linux machines may cause some confusion and maybe considered blasphemous by some!*	

#### 11. Firefox Preferences 
- Under Preferences -> Privacy -> History, select "Never remember history".
- *REASON: With everyone using a common login name, this reduces the likelihood that a person remains logged in to a website in Firefox after closing Firefox. This prevents the problem of opening Firefox and navigating to Gmail to find someone else's email account is already logged on. The Cadets should be told these computers are not for personal usage and that they should not expect privacy on these computers. Logging into personal online accounts is acceptable but they need to be aware of the limits to their privacy. These are great discussions to have with someone learning about computers.* 

#### 12. Scroll bars on the side of windows
- Type this in the terminal to get the scroll bars to appear:
- `gsettings set com.canonical.desktop.interface scrollbar-mode normal`
- *REASON: This are the more familiar scrollbars and make the UI behave as many Cadets would expect it.*

#### 13. Recently opened items list
- Type this in the terminal to increase the cached list of gedit:
- `gsettings set org.gnome.gedit.preferences.ui max-recents "uint32 30"`
- *REASON: The default setting is too small for the number of files that are used in these projects.*

#### 14. Disable bluetooth on start up
- In the file: /etc/bluetooth/main.conf change the InitiallyPowered setting to false. 
- It should look like this: InitiallyPowered = false
- *REASON: We often do not require bluetooth and we rather conserve the battery. This can always be re-enabled through the desktop gui.*

-----------------------------------------------------------------
### ROS Kinetic Kame 
-----------------------------------------------------------------

#### Installation
- Follow instructions on [ROS Wiki] (http://wiki.ros.org/kinetic/Installation/Ubuntu)


##### Turtlebot Player Stage Gazebo (Optional)

- `sudo apt-get install ros-kinetic-turtlebot-stage ros-kinetic-turtlebot-navigation ros-kinetic-turtlebot-gazebo ros-kinetic-turtlebot-apps ros-kinetic-turtlebot-rviz-launchers`

- Copy the map files to ~/stage by:
 - `mkdir ~/stage`
 - `cp -Rf /opt/ros/kinetic/share/turtlebot_stage/maps/ ~/stage/maps/`
 - `mkdir ~/gazebo`
 - `cp -Rf /opt/ros/kinetic/share/turtlebot_gazebo/worlds/ ~/gazebo/worlds`
 - `export TURTLEBOT_STAGE_MAP_FILE=~/stage/maps/maze.yaml`
 - `export TURTLEBOT_STAGE_WORLD_FILE=~/stage/maps/stage/maze.world`
 - `export TURTLEBOT_GAZEBO_WORLD_FILE=~/gazebo/worlds/playground.world`

- To run player stage 2d simulation:
 - `roslaunch turtlebot_stage turtlebot_in_stage.launch`

- To run gazebo 3d simulation, after stopping all the 2d processes:
 - `roslaunch turtlebot_gazebo turtlebot_world.launch`
 - *Be patient!*
 - `roslaunch turtlebot_rviz_launchers view_robot.launch`
  or
  `roslaunch turtlebot_teleop xbox360_teleop.launch` 
  or
  `roslaunch turtlebot_teleop keyboard_teleop.launch`
