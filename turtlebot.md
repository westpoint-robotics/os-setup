### These instructions are for the turtlebot's Acer Aspire E11 laptop and assumes you are starting from the turtlebot disk image found at [Turtlebot ISO Install](http://wiki.ros.org/turtlebot/Tutorials/indigo/ISO%20Installation)

#### 1. Instal helper applications and software
- `sudo apt-get install meld minicom ant git gitk gksu openssh-server terminator gparted`
----------------------------
#### 2. Extend length of History
- In the ~/.bashrc file change the below settings to lengthen the history file. Just add a couple zero’s to each setting.
- HISTSIZE=100000
- HISTFILESIZE=200000
- *REASON: This makes it much easier to find what was done to the computer in the past. Many of the users on these systems are not familiar with Linux. The ability to search the terminal history for commands and the way it was done last semester has proven valuable, especially at the start of the semester. It has also allowed Faculty to figure out what the users have done on the computer for debugging problems. The long length has proven its value mostly when trying to recreate work done in the previous school year. This justifies a reminder that the work done on these computers is not private.*
----------------------------
#### 3. Disable Power Saving
- Go to System Settings -> All Settings -> Brightness & Lock
- Disabled "Dim screen to save power"
- Set "Turn screen off when inactive for: Never"
- *REASON: Almost always, the laptops are placed in docking stations and rarely run low on battery. The auto-lock is more of an inconvenience and may cause errors while in the midst of a critical operation.*
----------------------------
#### 4. Edit Terminal's Default Profile
- Open Terminal. Click on Edit -> Profile Preferences
- On the Scrolling tab, uncheck the box "Limit scrollback to:"
- *REASON: Many times the output to the terminal sent by a build command exceeds this limit. To understand build problems, many times you need to scroll to the beginning of the output. This enables you to scroll back to the beginning of the buffer.*
----------------------------
#### 5. GEDIT Preferences.
- Open a text file using Gedit or type `gedit` in a terminal window and hit enter. This brings up the text editor.
- Click Edit -> Preferences -> Editor. 
- Change Tab width to 4 , Check the box for "Insert spaces instead of tabs"
- *REASON: The default 8 spaces per tab makes reading source code difficult. 4 spaces is an acceptable convention used by industry. Changing tabs to spaces as a convention is helpful when programming in Python or any other language that relies on indentation.*
----------------------------
#### 6. Allow user1 to dialout on USB devices
 - `sudo adduser user1 dialout`
 - *REASON: This allows user1 to read and write to most serial devices such as USB. Most robotics projects require this.*
 ----------------------------
#### 7. Fixed battery reading error in turtlebot by adding this line to the .bashrc file.
- `export TURTLEBOT_BATTERY="/sys/class/power_supply/BAT1"`
----------------------------
#### 8. Fixed joystick conflict.
- This conflict is caused becuase the joy node default joystick device location is at `/dev/input/js0` but the Acer Laptop maps its accelrometer to `js0`. Now when the xbox controller is plugged in it becomes `/dev/input/js1`. To solve this, edit the `xbox360_teleop.launch` file by running this command:

- `sudo sed -i '18i \ \ <param name="joystick/dev" value="/dev/input/js1"/>'  /opt/ros/indigo/share/turtlebot_teleop/launch/xbox360_teleop.launch`
--------------------------------
#### 9. NOTE: The following warning appears upon starting the xtion sensor.
- `Warning: USB events thread - failed to set priority. This might cause loss of data...`
- OpenNI tries to set the USB async thread priority to critical. This works on Linux only with root privileges. For a normal user, the program will throw this warning. Currently we ignore this warining.
- CURRENT SOLUTION: Ignore the USB events thread warning
----------------------------
