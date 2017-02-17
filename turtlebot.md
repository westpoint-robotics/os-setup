#-----Under construction-----

These instructions are for the turtlebot's Acer Aspire E11 laptop and assumes you are starting from the turtlebot disk image found at: http://wiki.ros.org/turtlebot/Tutorials/indigo/ISO%20Installation

#### 1. Fixed battery reading error in turtlebot by adding this line to the .bashrc file.

export TURTLEBOT_BATTERY="/sys/class/power_supply/BAT1"

----------------------------
#### 2. Fixed joystick conflict.

This conflict is caused becuase the joy node default joystick device location is
at /dev/input/js0 but the Acer Laptop maps its accelrometer to js0. Now when the
xbox controller is plugged in it becomes /dev/input/js1. To solve this, edit the
xbox360_teleop.launch file by running this command:

sudo sed -i '18i \ \ <param name="joystick/dev" value="/dev/input/js1"/>'  /opt/ros/indigo/share/turtlebot_teleop/launch/xbox360_teleop.launch

--------------------------------
#### 3. NOTE: The following warning appears upon starting the xtion sensor.

Warning: USB events thread - failed to set priority. This might cause loss of data...

OpenNI tries to set the USB async thread priority to critical. This works on Linux only with root privileges. For a normal user, the program will throw this warning. Currently we ignore this warining.

CURRENT SOLUTION: Ignore the USB events thread warning.
