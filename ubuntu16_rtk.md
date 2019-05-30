#### 1. Update the OS  
- `sudo apt-get update`
- `sudo apt-get upgrade`
- `sudo apt-get dist-upgrade`

#### 2. Install Google Chrome stable from a repo
- `wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -`
- `echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list`
- `sudo apt-get update` 
- `sudo apt-get install google-chrome-stable`

#### 3. Install additional tools
- `sudo apt-get install meld minicom ant git gitk gksu openssh-server terminator gparted git-core python-argparse python-wstool python-vcstools build-essential gedit-plugins` 

#### 4. Extend length of History
- In the ~/.bashrc file change the below settings to lengthen the history file. Just add a couple zero’s to each setting.
- HISTSIZE=100000
- HISTFILESIZE=200000

#### 5. Modify Power Saving
- Go to System Settings -> All Settings -> Brightness & Lock
- Check 'Dim screen to save power'
- Set "Turn screen off when inactive for: Never"
- Disable screen lock

#### 6. Edit Terminal's Default Profile
- Open Terminal. Click on Edit -> Profile Preferences
- On the Scrolling tab, uncheck the box "Limit scrollback to:"

#### 7. GEDIT Preferences.
- Open a text file using Gedit or type `gedit` in a terminal window and hit enter. This brings up the text editor.
- Click Edit -> Preferences -> Editor. 
- Change Tab width to 4 , Check the box for "Insert spaces instead of tabs"
- Enable block commenting. Click Edit -> Preferences -> Plugins, and check the box for "Code Comment"
- Enable highlight matching brackets. Click Edit -> Preferences -> View, and check the box for "Highlight matching brackets"

#### 8. Allow user1 to dialout on USB devices
 - `sudo adduser user1 dialout`
 
#### 9. Setup git
- `git config --global user.email "dominic.larkin@westpoint.edu"`
- `git config --global user.name "User1 Nuvo"`
- `git config --global push.default simple`
- `git config --global credential.helper "cache --timeout=60000"`

#### 10. Setup DI2E access with keys
- Add the public key to the computers known-hosts. 
    - Copy the public key to ~/.ssh and cd into that directory:  
        `cd ~/.ssh`
    - Set proper permission for key:  
        `chmod 600 bitbucket_id_rsa`
    - Add key to knownhosts  
        `ssh-add bitBucket_id_rsa`
        
#### 11. Clone this repo from DI2E bitbucket:
- `cd ~`
- `git clone ssh://git@bitbucket.di2e.net:7999/rtk/configuration.git`
- `cd ~/configuration`
- `./setup_workspace.sh`
    - Note: If the credential times out you will get errors for the repos that could not clone. If this happens reload you credentials and run the script again. `ssh-add bitBucket_id_rsa`
- `cd $HOME/code/rtk`
- `catkin build`
    
    
sudo apt-get install libopenni2-*
### THESE ERRORS occured:    
- CMake Error at /usr/lib/x86_64-linux-gnu/cmake/Qt5Gui/Qt5GuiConfig.cmake:27 (message):
  The imported target "Qt5::Gui" references the file

     "/usr/lib/x86_64-linux-gnu/libEGL.so"

  but this file does not exist.  
- REASON: The version of the libEGL.so and libGL.so file are hard coded somewhere. If a different version is installed on the computer then this error occurs.
- FIX: Created a symbolic link from the missing version number to the existing version number with commands like:

`sudo rm /usr/lib/x86_64-linux-gnu/libEGL.so`

`sudo ln -s /usr/lib/x86_64-linux-gnu/mesa-egl/libEGL.so /usr/lib/x86_64-linux-gnu/libEGL.so`

AND
`sudo rm /usr/lib/x86_64-linux-gnu/mesa/libGL.so`

`sudo ln -s /usr/lib/x86_64-linux-gnu/libGL.so.1.7.0 /usr/lib/x86_64-linux-gnu/mesa/libGL.so`

## After RTK success install
### Modify /etc/hosts file by adding: TODO: This should not be required, remove all reference to other computers should be removed.  
127.0.0.1       mrzr-8803-localization  
127.0.0.1       mrzr-8803-lidar  
127.0.0.1       mrzr-8803-vision  

### Added to .bashrc

source /opt/ros/kinetic/setup.bash 
source /home/user1/code/rtk/devel/setup.bash  
source /home/user1/as_drivers/devel/setup.bash --extend  

### Add Autonomous Stuff drivers
These can be downloaded from AStuff github.  

Unpack the file: pacmod_ros_install.tar.gz  
Follow instructions in with the below exception: readme_first.txt   
Instead of doing the first steps, cd into the directory called pacmod_ros_install then run this command:  

`chmod +x pacmod_install.sh`   
`./pacmod_install.sh`   

Problem with library versions again:  
  205  locate listChannels  
  206  sudo ln -s /usr/src/linuxcan-5.27.776 /usr/src/linuxcan-5.24.533  
  207  eval /usr/src/linuxcan-5.24.533/canlib/examples/listChannels  
  208  locate linuxcan   


  `<arg name="is_pacmod_3" default="true" />`  
to

  `<arg name="is_pacmod_3" default="false" />`  
  
  
  `<arg name="pacmod_can_hardware_id" default="43029" />`  
to
    `<arg name="pacmod_can_hardware_id" default="10812" /> `  
    
    Change to the serial number of the device we are using. Omit the leading zero.
SN of Canbus interface device: 010812  
    
    
  `<arg name="pacmod_vehicle_type" default="LEXUS_RX_450H" />`  
  to
    `<arg name="pacmod_vehicle_type" default="POLARIS_GEM" />`  
    
Exit from pacmod_game_control.launch  

### Verify Pacmod is working with a joystick:
The Logitech Joystick that belongs to the GEM E2 must be in the x position. On the bottom of the joystick is switch with a x and y position.

run the command:  
`roslaunch pacmod_game_control pacmod_game_control.launch`

With the estop off and vehicle in Neutral and Parking Brake OFF and joystick plugged in, you can drive the E2.



### Install XSENS navigation system software
cd as_drivers/src/  
git clone https://github.com/westpoint-robotics/usma_xsens.git  
sudo apt-get install ros-kinetic-gps-common libpcap0.8-dev  

sudo su  
echo 'SUBSYSTEM=="tty", ATTRS{idProduct}=="0017", ATTRS{idVendor}=="2639", ATTRS{manufacturer}=="Xsens", SYMLINK+="mti700", ACTION=="add", GROUP="dialout", MODE="0660"' >> /etc/udev/rules.d/99-xsens.rules  
echo 'SUBSYSTEM=="tty", ATTRS{idProduct}=="0003", ATTRS{idVendor}=="2639", ATTRS{manufacturer}=="Xsens", SYMLINK+="mti300", ACTION=="add", GROUP="dialout", MODE="0660"' >> /etc/udev/rules.d/99-xsens.rules  
udevadm control --reload-rules  
exit  

####### TODO FXTHIS. Hardcode change in node src for frame id and topics.
added to bashrc  
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/home/user1/as_drivers/src/usma_xsens  


### Get the updated velodyne drivers from TARDEC that work with the 64E  
These files came from TARDEC from Jack Hartner.  

velodyne_hl folder moved to:  
code/rtk/src/TARDEC/tardec_perception/  

velodyne_ll to:  
code/rtk/src/TARDEC/tardec_drivers/  

user1@nuvo:~$ rm -rf code/rtk/src/TARDEC/tardec_perception/velodyne_hl/
user1@nuvo:~$ mv velodyne_hl/ code/rtk/src/TARDEC/tardec_perception/
user1@nuvo:~$ rm -rf code/rtk/src/TARDEC/tardec_drivers/velodyne_ll/
user1@nuvo:~$ mv velodyne_ll/ code/rtk/src/TARDEC/tardec_drivers/



### mode other code in RTK
Modify this file:
/home/user1/code/rtk/src/SUMET/sumet_vehicle_interface/sumet_low_level_controller/src/gear_state_module.cpp

Change the below code to this: (around line 359)
void GearStateModule::handleTransmissionSense(
  const marti_dbw_msgs::TransmissionFeedbackConstPtr &msg)
{
  reported_gear_ = oldRangeFromNew(msg->current_range);  
//  if (!msg->stable) {
//    current_gear_ = snm::DbwGear::UNKNOWN;
//  } else {
//    current_gear_ = reported_gear_;
//  }
    current_gear_ = reported_gear_;
}

user1@nuvo:~/code/rtk/src/SUMET/sumet_platform/platform_common/launch$ gedit localization.launch 


### Rebuild the rtk code
- `cd $HOME/code/rtk`
- `catkin build`

### Add the 2019 Code and Launch file
  255  mv mrzr_8803.launch code/rtk/src/SUMET/sumet_platform/mrzr_8803/launch/
  256  mv gem_to_rtk_report.py Desktop/
  257  mv rtk_to_gem_low.py Desktop/


Modify the file and save as _new
gedit /home/user1/code/rtk/src/SUMET/sumet_platform/platform_common/launch/velodyne_new.launch
 
  <arg name="front_lidar_ip" default="192.168.1.10"/>
  <arg name="front_lidar_model" default="HDL64E"/>


  <arg name="rear_lidar_ip" default="192.168.1.10"/>
  <arg name="rear_lidar_model" default="HDL64E"/>

### Run the system
First start WMI, it appears to have a better chance of working if WMI is running first.

Second:
user1@nuvo:~$ roslaunch mrzr_8803 mrzr_8803.launch 
user1@nuvo:~$ python Desktop/rtk_to_gem_low.py 
user1@nuvo:~$ python Desktop/gem_to_rtk_report.py 




user1@nuvo:~$ mv localization_new.launch ~/code/rtk/src/SUMET/sumet_platform/platform_common/launch
user1@nuvo:~$ mv velodyne_new.launch ~/code/rtk/src/SUMET/^C
user1@nuvo:~$ ^C
user1@nuvo:~$ mv velodyne_new.launch ~/code/rtk/src/SUMET/sumet_platform/platform_common/launch



Inside: 
localization_new.launch:
        <node pkg="xsens_driver" type="mtnode_new.py" name="xsens_driver" output="screen" ns="xsens">
		    <param name="frame_id" value="$(arg frame_id)"/>
		    <param name="frame_local" value="$(arg frame_local)"/>
		    <param name="frame_local_imu" value="$(arg frame_local_imu)"/>
        	    <param name="device" value="/dev/mti700"/>
        	    <param name="baudrate" value="115200"/>
              <remap from="/localization/imu/raw" to='imu/data'/>
              <remap from="/localization/fix" to="fix"/>
              <remap from="/localization/gps" to="fix_extended"/>



