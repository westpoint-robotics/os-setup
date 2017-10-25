### These instructions are for the HP Elite desktop computers in RRC laboratories and assumes you have installed [Ubuntu 16.04 LTS](http://releases.ubuntu.com/16.04/)
----------------------------

#### 1. Install helper applications and software
- `sudo apt-get install meld minicom ant git gitk gksu openssh-server terminator gparted`
----------------------------
#### 2. Install the classical looking desktop session and switch to Metacity on logon:
- `sudo apt-get install gnome-session-flashback`
- Then logout, on the login screen click the Ubuntu icon and switch to metacity, log back in.
- Add icons to the top panel by left-click, drag and drop. Typically do this for Terminal, Gedit, Firefox.
- *REASON: Many Cadets dislike the learning curve associated with unfamiliar UI of Unity. They can easily transition to using the classical desktop environment. The enhancements offered by Unity provide no value to our projects.*
----------------------------
#### 3. Change computer name (If the computer name and user name are not already set to the below values):
- `gksu gedit /etc/hosts`
- `gksu gedit /etc/hostname`
- Change computer name to rosxxx (or the prevailing convention) where xx is the laptop number
- Set user to 'user1' or 'rrc'
- Assign a password as per the prevailing EECS convention.
- *REASON: This computer naming convention removed much confusion over computer behavior while communicating over the network and with Robots. The common user name and password has significantly simplified the problem of working on multiple computers. It makes having discussion about "user space" vs "system space" much more clear and easier to relate to material taught in the curriculum.*  
----------------------------
#### 4. Extend length of History
- In the ~/.bashrc file change the below settings to lengthen the history file. Just add a couple zero’s to each setting.
- HISTSIZE=100000
- HISTFILESIZE=200000
- * REASON: This makes it much easier to find what was done to the computer in the past. Many of the users on these systems are not familiar with Linux. The ability to search the terminal history for commands and the way it was done last semester has proven valuable, especially at the start of the semester. It has also allowed Faculty to figure out what the users have done on the computer for debugging problems. The long length has proven its value mostly when trying to recreate work done in the previous school year. This justifies a reminder that the work done on these computers is not private.* 	
----------------------------
#### 5. Edit Terminal's Default Profile
- Open Terminal. Click on Edit -> Profile Preferences
- On the Scrolling tab, uncheck the box "Limit scrollback to:"
- *REASON: Many times the output to the terminal sent by a build command exceeds this limit. To understand build problems, many times you need to scroll to the beginning of the output. This enables you to scroll back to the beginning of the buffer.*
----------------------------
#### 6. GEDIT Preferences.
- Open a text file using Gedit or type `gedit` in a terminal window and hit enter. This brings up the text editor.
- Click Edit -> Preferences -> Editor. 
- Change Tab width to 4 , Check the box for "Insert spaces instead of tabs"
- *REASON: The default 8 spaces per tab makes reading source code difficult. 4 spaces is an acceptable convention used by industry. Changing tabs to spaces as a convention is helpful when programming in Python or any other language that relies on indentation.*
----------------------------
#### 7. Allow user1 to dialout on USB devices
 - `sudo adduser user1 dialout`
 - *REASON: This allows user1 to read and write to most serial devices such as USB. Most robotics projects require this.*
----------------------------
#### 8. Firefox Preferences 
- Under Preferences -> Privacy -> History, select "Never remember history".
- *REASON: With everyone using a common login name, this reduces the likelihood that a person remains logged in to a website in Firefox after closing Firefox. This prevents the problem of opening Firefox and navigating to Gmail to find someone else's email account is already logged on. The Cadets should be told these computers are not for personal usage and that they should not expect privacy on these computers. Logging into personal online accounts is acceptable but they need to be aware of the limits to their privacy. These are great discussions to have with someone learning about computers.* 
----------------------------
#### 9. Scroll bars on the side of windows
- Type this in the terminal to get the scroll bars to appear:
- `gsettings set com.canonical.desktop.interface scrollbar-mode normal`
- *REASON: This are the more familiar scrollbars and make the UI behave as many Cadets would expect it.*
----------------------------
#### 10. Recently opened items list
- Type this in the terminal to increase the cached list of gedit:
- `gsettings set org.gnome.gedit.preferences.ui max-recents "uint32 30"`
- *REASON: The default setting is too small for the number of files that are used in some projects.*
----------------------------
#### 11. Disable automatic updates
- System Settings -> Software & Updates -> Updates
- Uncheck 'Unsupported updates'
- Set 'Automatically check for updates: Never'
- Set 'When there are other updates: Display every two weeks'
- *REASON: Certain unsupported updates cause unwarranted errors and discrepancies. The cadets usually wont track the updates they've applied. Its best for the system admin (OIC/CSG/ESG) to manually update the laptop before handing out to cadets. Cadets can always use `sudo apt-get update` if requrired.*
----------------------------
#### 12. Change screen lock timeout
- System Settings -> Brightness & Lock
- Turn screen off when inactive for: `1 hour`
- Lock screen after: `screen turns off`
- Check box for requiring password on wake up.
----------------------------
#### 13. Install [GIMP](https://www.gimp.org/) (Optional)
- `sudo add-apt-repository ppa:otto-kesselgulasch/gimp`
- `sudo apt-get update`
- `sudo apt-get install gimp`
- *REASON: Computer vision projects could use this as an image manipulation tool.*
-----------------------------
#### 14. Install [Sublime 2](https://www.sublimetext.com/) text editor (Optional)
- `sudo add-apt-repository ppa:webupd8team/sublime-text-2`
- `sudo apt-get update`
- `sudo apt-get install sublime-text`
- *REASON: Some cadets prefer using different text editors. This is one good alternative to gedit. Another option is Atom*
-----------------------------

-----------------------------------------------------------------
### ROS Kinetic Kame 
-----------------------------------------------------------------

#### Installation
- Follow instructions on the [ROS Wiki](http://wiki.ros.org/kinetic/Installation/Ubuntu) for a full-desktop install.
-----------------------------
#### Install additional tools and drivers:
- `sudo apt-get install git-core python-argparse python-wstool python-vcstools python-rosdep ros-kinetic-control-msgs ros-kinetic-joystick-drivers`
-----------------------------
#### Create catkin workspace
- `mkdir -p ~/catkin_ws/src`
- `cd ~/catkin_ws/src`
- `catkin_init_workspace`
- `cd ~/catkin_ws/`
- `catkin_make`
- `echo "source $HOME/catkin_ws/devel/setup.bash" >> ~/.bashrc`
- `source $HOME/catkin_ws/devel/setup.bash`
- `rospack profile`
-----------------------------
 #### Display Git-branch in command line prompt (Optional)
- Copy and paste the following lines into the ~/.bashrc file
```
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
```
- *REASON: Useful when working with Git repositories. Prevents users from accidentally committing code to the incorrect branch*
-----------------------------
-----------------------------------------------------------------
#### Remote Desktop (Optional) 
-----------------------------------------------------------------
 1. [VNC](https://www.linode.com/docs/applications/remote-desktop/install-vnc-on-ubuntu-16-04)
 2. [VNC](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-16-04)
 3. [VNC](http://www.krizna.com/ubuntu/enable-remote-desktop-ubuntu-16-04-vnc/)
 4. [XRDP](https://askubuntu.com/questions/746303/how-to-remote-into-16-04-via-rdp)
