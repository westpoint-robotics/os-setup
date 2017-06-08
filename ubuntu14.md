## For Ubuntu 14.04 LTS 

Below are the setup instructions to follow once you have a clean install of Ubuntu 14.04 

#### 1. Instal helper applications and software
- `sudo apt-get install meld minicom ant git gitk gksu openssh-server terminator gparted`

#### 2. Change computer name (If the computer name and user name are not already set to the below values):
- `gksu gedit /etc/hosts`
- `gksu gedit /etc/hostname`
- Change computer name to roslabxx where xx is the laptop number
- Set user to 'user1'
- Assign a password as per the prevailing EECS convention.
- *REASON: This computer naming convention removed much confusion over computer behavior while communicating over the network and with Robots. The common user name and password has significantly simplified the problem of working on multiple computers. It makes having discussion about "user space" vs "system space" much more clear and easier to relate to material taught in the curriculum.*  

#### 3. Install the classical looking desktop session and switch to Metacity on logon:
- `sudo apt-get install gnome-session-flashback`
- Then logout, on the login screen click the Ubuntu icon and switch to metacity, log back in.
- Add icons to the top panel by left-click, drag and drop. Typically do this for Terminal, Gedit, Firefox.
- *REASON: Many Cadets dislike the learning curve associated with unfamiliar UI of Unity. They can easily transition to using the classical desktop environment. The enhancements offered by Unity provide no value to our projects.*

#### 4. Extend length of History
- In the ~/.bashrc file change the below settings to lengthen the history file. Just add a couple zero’s to each setting.
- HISTSIZE=100000
- HISTFILESIZE=200000
- *REASON: This makes it much easier to find what was done to the computer in the past. Many of the users on these systems are not familiar with Linux. The ability to search the terminal history for commands and the way it was done last semester has proven valuable, especially at the start of the semester. It has also allowed Faculty to figure out what the users have done on the computer for debugging problems. The long length has proven its value mostly when trying to recreate work done in the previous school year. This justifies a reminder that the work done on these computers is not private.* 	

#### 5. Disable Power Saving
- Go to System Settings -> All Settings -> Brightness & Lock
- Disabled "Dim screen to save power"
- Set "Turn screen off when inactive for: Never"
- *REASON: Almost always, the laptops are placed in docking stations and rarely run low on battery. The auto-lock is more of an inconvenience and may cause errors while in the midst of a critical operation.*

#### 6. Edit Terminal's Default Profile
- Open Terminal. Click on Edit -> Profile Preferences
- On the Scrolling tab, uncheck the box "Limit scrollback to:"
- *REASON: Many times the output to the terminal sent by a build command exceeds this limit. To understand build problems, many times you need to scroll to the beginning of the output. This enables you to scroll back to the beginning of the buffer.*

#### 7. GEDIT Preferences.
- Open a text file using Gedit or type `gedit` in a terminal window and hit enter. This brings up the text editor.
- Click Edit -> Preferences -> Editor. 
- Change Tab width to 4 , Check the box for "Insert spaces instead of tabs"
- *REASON: The default 8 spaces per tab makes reading source code difficult. 4 spaces is an acceptable convention used by industry. Changing tabs to spaces as a convention is helpful when programming in Python or any other language that relies on indentation.*

#### 8. Allow user1 to dialout on USB devices
 - `sudo adduser user1 dialout`
 - *REASON: This allows user1 to read and write to most serial devices such as USB. Most robotics projects require this.*

#### 9. Create 'cls' command 
- In order to have a quick way to clear the screen add the below line to ~/.bashrc 
- alias cls='printf "\033c"'
- *REASON: Commonly when you build a large application a lot of output is sent to the terminal. It can be difficult to tell when your last build output stopped and the new build began. The 'cls' alias clears the screen and the buffer (unlike the Linux "clear" command). Running 'cls' before a new build allows you to scroll to the top of the buffer to find the start of the output for this build. This is in honor to the old MS-DOS command 'cls' that behaved this way. Having 'cls' on Linux machines may cause some confusion and maybe considered blasphemous by some!*	

#### 10. Firefox Preferences 
- Under Preferences -> Privacy -> History, select "Never remember history".
- *REASON: With everyone using a common login name, this reduces the likelihood that a person remains logged in to a website in Firefox after closing Firefox. This prevents the problem of opening Firefox and navigating to Gmail to find someone else's email account is already logged on. The Cadets should be told these computers are not for personal usage and that they should not expect privacy on these computers. Logging into personal online accounts is acceptable but they need to be aware of the limits to their privacy.* 

#### 11. Scroll bars on the side of windows
- Type this in the terminal to get the scroll bars to appear:
- `gsettings set com.canonical.desktop.interface scrollbar-mode normal`
- *REASON: This are the more familiar scrollbars and make the UI behave as many Cadets would expect it.*

#### 12. Recently opened items list
- Type this in the terminal to increase the cached list of gedit:
- `gsettings set org.gnome.gedit.preferences.ui max-recents "uint32 30"`
- *REASON: The default setting is too small for the number of files that are used in these projects.*

#### 13. Disable bluetooth on start-up
- `gksu gedit /etc/bluetooth/main.conf`
- Change the InitiallyPowered setting to false.
- *REASON: We often do not use bluetooth and can conserve battery power. This can still be re-enabled through the desktop gui.*

#### 14. NVIDIA Display Driver
- System Settings -> Software & Updates -> Additional Drivers
- Select the NVIDIA driver which is proprietary and tested.
- It takes about 5 minutes for the changes to be applied. Be patient!
- *REASON: The default display driver by X.Org has caused frequent screen freezes and bizzare macro blocks to appear. The one by NVIDIA has proven to work without such mishaps.*

#### 15. Disable automatic updates
- System Settings -> Software & Updates -> Updates
- Uncheck 'Unsupported updates'
- Set 'Automatically check for updates: Never'
- Set 'When there are other updates: Display every two weeks'
- *REASON: Certain unsupported updates cause unwarranted errors and discrepancies. The cadets usually wont track the updates they've applied. Its best for the system admin (OIC/CSG/ESG) to manually update the laptop before handing out to cadets. Cadets can always use `sudo apt-get update` if requrired.*

#### 16. Disable the Scroll-wheel click 
- echo 'xmodmap -e "pointer = 1 9 3 4 5 6 7 8 2"' > ~/.Xmodmap
- *REASON: Prevent accidental pasting of text from buffer while scrolling through code.*

-----------------------------------------------------------------
### ROS Indigo Igloo
-----------------------------------------------------------------

#### Installation
- Follow instructions on [ROS Wiki](http://wiki.ros.org/indigo/Installation/Ubuntu)

#### Install additional tools and drivers(Optional):
- `sudo apt-get install git-core python-argparse python-wstool python-vcstools python-rosdep ros-indigo-control-msgs ros-indigo-joystick-drivers`

#### Create catkin workspace:
- `mkdir -p ~/catkin_ws/src`
- `cd ~/catkin_ws/src`
- `catkin_init_workspace`
- `cd ~/catkin_ws/`
- `catkin_make`
- `echo "source $HOME/catkin_ws/devel/setup.bash" >> ~/.bashrc`
- `source $HOME/catkin_ws/devel/setup.bash`
- `rospack profile`
  

-----------------------------------------------------------------
### Arduino and ROS_Serial 
-----------------------------------------------------------------
#### Arduino IDE
- `sudo apt-get update `
- Arduino IDE: `sudo apt-get install arduino arduino-core`
- Open the IDE by clicking on Applications -> Programming -> Arduino IDE
- Close the Arduino IDE. This will create the directory structure needed to continue.
#### ROS Serial
- `sudo apt-get install ros-indigo-rosserial-arduino ros-indigo-rosserial`
- `cd ~/sketchbook/libraries`
- `rm -rf ros_lib`
- `rosrun rosserial_arduino make_libraries.py .`
- `sudo apt-get purge brltty`
- Run the example sketch-
  - Go to Applications -> Programming -> Arduino IDE
  - File -> Examples -> ros_lib -> blink
  - Tools -> Serial Port -> /dev/TTYACM0
  - Click on 'upload'
  - Open a terminal and run `roscore &` and `rosrun rosserial_python serial_node.py _port:=/dev/ttyACM0`
  - In another terminal run `rostopic pub toggle_led std_msgs/Empty --once`. Each time you run this it will toggle the light on or off.
        
- ROS Serial [Wiki](http://wiki.ros.org/rosserial_arduino/Tutorials)
