1. Update the OS  
    - `sudo apt-get update`
    - `sudo apt-get upgrade`
    - `sudo apt-get dist-upgrade`

1. Install Google Chrome stable from a repo  
    - `wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -`
    - `echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list`
    - `sudo apt-get update` 
    - `sudo apt-get install google-chrome-stable`

1. Install additional tools  
    - `sudo apt-get install meld minicom ant git gitk gksu openssh-server terminator gparted git-core python-argparse python-wstool python-vcstools build-essential gedit-plugins` 

1. Install additional simplescreenrecorder for recording the desktop  
    - `sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder`
    - `sudo apt-get update`
    - `sudo apt-get install simplescreenrecorder`

1. Extend length of History  
    - In the ~/.bashrc file change the below settings to lengthen the history file. Just add a couple zero’s to each setting.
    - HISTSIZE=100000
    - HISTFILESIZE=200000

1. Modify Power Saving
    - Go to System Settings -> All Settings -> Brightness & Lock
    - Check 'Dim screen to save power'
    - Set "Turn screen off when inactive for: Never"
    - Disable screen lock

1. Edit Terminal's Default Profile
    - Open Terminal. Click on Edit -> Profile Preferences
    - On the Scrolling tab, uncheck the box "Limit scrollback to:"

1. GEDIT Preferences.
    - Open a text file using Gedit or type `gedit` in a terminal window and hit enter. This brings up the text editor.
    - Click Edit -> Preferences -> Editor. 
    - Change Tab width to 4 , Check the box for "Insert spaces instead of tabs"
    - Enable block commenting. Click Edit -> Preferences -> Plugins, and check the box for "Code Comment"
    - Enable highlight matching brackets. Click Edit -> Preferences -> View, and check the box for "Highlight matching brackets"

1. Allow user1 to dialout on USB devices
    - `sudo adduser user1 dialout`
 
1. Setup git
    - `git config --global user.email "user1@usmawkdd113801.com"`
    - `git config --global user.name "User1 Usmawkdd113801"`
    - `git config --global push.default simple`
    - `git config --global credential.helper "cache --timeout=60000"`

1. Setup DI2E access with keys
    - Add the public key to the computers known-hosts. 
        - Copy the public key to ~/.ssh and cd into that directory:  
            `cd ~/.ssh`
        - Set proper permission for key:  
            `chmod 600 bitbucket_id_rsa`
        - Add key to knownhosts  
            `ssh-add bitBucket_id_rsa`
    - NOTE: If you have trouble with access denied then see Mr. Larkin in the RRC.
        
1. Clone this repo from DI2E bitbucket:
    - `cd ~`
    - Add key to knownhosts:  
     `ssh-add bitBucket_id_rsa`
    - `git clone ssh://git@bitbucket.di2e.net:7999/rtk/configuration.git`
    - `cd ~/configuration`
    - `./setup_workspace.sh`
        - Note: If the credential times out you will get errors for the repos that could not clone. If this happens reload you credentials and run the script again.  
     `ssh-add bitBucket_id_rsa`
    - `cd $HOME/code/rtk`
    - `catkin build`

1. Added to .bashrc

    - `source /opt/ros/kinetic/setup.bash`  
    - `source /home/user1/code/rtk/devel/setup.bash`  
    - `source /home/user1/as_drivers/devel/setup.bash --extend`  
    
1. Install pacmod and dependencies:
    - `sudo apt-get install ros-kinetic-can-msgs`

1. Add Autonomous Stuff drivers
    - The pacmod install script is in a file called: pacmod_ros_install.tar.gz

    - Unpack the file: pacmod_ros_install.tar.gz  
    - Follow instructions in readme_first.txt with the below exception:  
    Instead of doing the first steps, cd into the directory called pacmod_ros_install then run this command:  

    `chmod +x pacmod_install.sh`  
    `bash ./pacmod_install.sh`  
    
    - Then edit the launch file to work with our hardware:  
    `roscd pacmod_game_control/launch && gedit pacmod_game_control.launch`

    Change this:  
    `<arg name="is_pacmod_3" default="true" />`  
    to  
    `<arg name="is_pacmod_3" default="false" />`  
    
    And change to the serial number of the device we are using. Omit the leading zero.
    SN of Canbus interface device: 010812  
    `<arg name="pacmod_can_hardware_id" default="43029" />`  
    to  
    `<arg name="pacmod_can_hardware_id" default="10812" /> `  
            
    Change this:  
    `<arg name="pacmod_vehicle_type" default="LEXUS_RX_450H" />`  
      to  
    `<arg name="pacmod_vehicle_type" default="POLARIS_GEM" />`  
        
    Save and Exit from editing pacmod_game_control.launch  

1. Verify Pacmod is working with a joystick:
    The Logitech Joystick that belongs to the GEM E2 must be in the x position. On the bottom of the joystick is switch with a x and y position.

    run the command:  
    `roslaunch pacmod_game_control pacmod_game_control.launch`

    With the estop off and vehicle in Neutral and Parking Brake OFF and joystick plugged in, you can drive the E2.


1. Install XSENS navigation system software
    - `cd ~/catkin_ws/src/`  
    - `git clone https://github.com/westpoint-robotics/usma_xsens.git`  
    - `sudo apt-get install ros-kinetic-gps-common libpcap0.8-dev`  
    - `sudo su`  
    - `echo 'SUBSYSTEM=="tty", ATTRS{idProduct}=="0017", ATTRS{idVendor}=="2639", ATTRS{manufacturer}=="Xsens", SYMLINK+="mti700", ACTION=="add", GROUP="dialout", MODE="0660"' >> /etc/udev/rules.d/99-xsens.rules`  
    - `echo 'SUBSYSTEM=="tty", ATTRS{idProduct}=="0003", ATTRS{idVendor}=="2639", ATTRS{manufacturer}=="Xsens", SYMLINK+="mti300", ACTION=="add", GROUP="dialout", MODE="0660"' >> /etc/udev/rules.d/99-xsens.rules`  
    - `udevadm control --reload-rules`  
    - `exit`  
    - Add to bashrc:  
    `export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/home/user1/catkin_ws/src/usma_xsens`  

1. Instal Vimba_2_1 Camera Drivers
    - extract the files from Vimba_v2.1.3_Linux.tgz
    - Follow the instructions on page 29 of the "Vimba Manual for Linux" 

    - Install ROS package for Vimba
    `sudo apt-get install ros-kinetic-avt-vimba-camera`

1. Pull the latest GEM updates
    - `cd ~/catkin_ws/src/gem_e2`  
    - `git clone ssh://git@bitbucket.di2e.net:7999/rtk4isa/gem_e2.git`  
    - `cd ~/catkin_ws` 
    - `catkin_make`

# Below here are notes on process used for initial setup:
## The information below this point was used to get RTK2018 working with AY19 code. Some of this may not be needed as we move forward.
### Modify /etc/hosts file by adding: TODO: This should not be required, remove all reference to other computers should be removed.  
127.0.0.1       mrzr-8803-localization  
127.0.0.1       mrzr-8803-lidar  
127.0.0.1       mrzr-8803-vision  

### Get the updated velodyne drivers from TARDEC that work with the 64E  
These files came from TARDEC from Jack Hartner.  

velodyne_hl folder moved to: code/rtk/src/TARDEC/tardec_perception/  
`rm -rf code/rtk/src/TARDEC/tardec_perception/velodyne_hl/`  
`mv velodyne_hl/ code/rtk/src/TARDEC/tardec_perception/`  

velodyne_ll to: code/rtk/src/TARDEC/tardec_drivers/  
`rm -rf code/rtk/src/TARDEC/tardec_drivers/velodyne_ll/`  
`mv velodyne_ll/ code/rtk/src/TARDEC/tardec_drivers/`  



### Move other code in RTK
Modify this file:  
/home/user1/code/rtk/src/SUMET/sumet_vehicle_interface/sumet_low_level_controller/src/gear_state_module.cpp  

Change the below code to this: (around line 359)  
```
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
```

user1@nuvo:~/code/rtk/src/SUMET/sumet_platform/platform_common/launch$ gedit localization.launch 


### Rebuild the rtk code
- `cd $HOME/code/rtk`
- `catkin build`

### Add the AY2019 Code and Launch file   
  255  mv mrzr_8803.launch code/rtk/src/SUMET/sumet_platform/mrzr_8803/launch/  
  256  mv gem_to_rtk_report.py Desktop/  
  257  mv rtk_to_gem_low.py Desktop/  


Modify the file and save as _new
gedit /home/user1/code/rtk/src/SUMET/sumet_platform/platform_common/launch/velodyne_new.launch
 
  `<arg name="front_lidar_ip" default="192.168.1.10"/>`
  `<arg name="front_lidar_model" default="HDL64E"/>`


  `<arg name="rear_lidar_ip" default="192.168.1.10"/>`
  `<arg name="rear_lidar_model" default="HDL64E"/>`

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
       ` <node pkg="xsens_driver" type="mtnode_new.py" name="xsens_driver" output="screen" ns="xsens">
		    <param name="frame_id" value="$(arg frame_id)"/>
		    <param name="frame_local" value="$(arg frame_local)"/>
		    <param name="frame_local_imu" value="$(arg frame_local_imu)"/>
        	    <param name="device" value="/dev/mti700"/>
        	    <param name="baudrate" value="115200"/>
              <remap from="/localization/imu/raw" to='imu/data'/>
              <remap from="/localization/fix" to="fix"/>
              <remap from="/localization/gps" to="fix_extended"/>`



