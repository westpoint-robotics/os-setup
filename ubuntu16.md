### For Ubuntu 16.04 LTS 

Below are the setup instructions to follow once you have a clean install of Ubuntu 16.04 

-----
1. Install the classical looking desktop session and switch to metacity on logon:
    sudo apt-get install gnome-session-fallback
Then logout, on the login screen click the Ubuntu icon and switch to metacity, log back in.
Then add icons to the top panel by left-click drag and drop. Typically do this for terminal, Gedit, Firefox.

REASON: Many Cadets dislike the learning curve and unfamiliar UI associated with Unity. 
They can very quickly use the classical desktop environments. I have found quite a few Cadets that found Unity to be annoying and no Cadet’s have complained about the usability of the classical desktops. The enhancements offered by Unity provide no value to these projects.

-----
1.A. Change computer name (If the computer name and user name are not already set to the below values):
    sudo gedit /etc/hosts
    sudo gedit /etc/hostname
Change computer name to tbotxx where xx is laptop number

user: user1
Pw: turtlebot

REASON COMPUTER NAME: This computer naming convention was implemented for AY2016 and removed much confusion over computer behavior. The label maker in ESG was used to generate labels with the computer name on it and placed both on the inside near the keyboard and outside of each laptop. The Cadets refer to these as the ROS computers and there is a lot less confusion in conversations about the computers. 

REASON USER NAME: The common user name and password has significantly simplified the problem of working on multiple computers. It is a simple answer and easy to maintain, there other answers that provide more security and privacy but the benefits of these other solutions add very little value to the projects and add more complexity and difficulty for the Faculty and Cadets. I have found it makes having discussion about "user space" vs "system space" much more clear and easier to relate to material taught in the CS curriculum.  

-----
2. In Firefox under "Preferences | Privacy | History" choose "Never remember history".

REASON: With everyone using a common login name, this reduces the likelihood that a person remains logged in to a website in Firefox after closing Firefox. This prevents the problem of opening Firefox and navigating to Gmail to find someone else's email account is already logged on. The Cadet's should be told these computers are not for personal usage and that they should not expect privacy on these computers, they are for Robotic Project work. Logging into personal online accounts is acceptable but they need to be aware of the limits to their privacy. These are great discussions to have with someone learning about computers. 

----
3. In order to have a quick way to clear the screen add the below line to ~/.bashrc 
	alias cls='printf "\033c"'
	
REASON: Commonly when you build a large application a lot of output is sent to the terminal. When you build repeatedly it can be difficult to tell when your last build output stopped and the new build began. The 'cls' alias clears the screen and the buffer (unlike the Linux "clear" command). Running 'cls' before a new build allows you to scroll to the top of the buffer to find the start of the output for this build. "WARNING": This is in honor to the old MS-Dos command 'cls' that behaved this way. Having 'cls' on Linux machines may cause some confusion and maybe considered blasphemous by some. 	

-----
4. In the ~/.bashrc file change the below settings to lengthen the history file. This makes it much easier to find what was done to the computer in the past. Just add a couple zero’s to each setting.

	HISTSIZE=100000
	HISTFILESIZE=200000
	
REASON: Many of the users on these systems are not familiar with Linux. The ability to search the terminal history for commands and the way it was done last semester has proven valuable, especially at the start of the semester. It has also allowed Faculty to figure out what the users have done on the computer for debugging problems. The long length has proven its value mostly when trying to recreate work done in the previous school year. This justifies a reminder that the work done on these computers is not private. 	

-----	
5. In “System Settings | All Settings | Brightness & Lock”
	a. Turned the Lock off
	b. Disabled "Dim screen to save power"
	c. Set "Turn screen off when inactive for:" 30 minutes

-----
6. Edited the Terminal's Default Profile to make the following change:
	On the Scrolling tab - checked the block for "Unlimited scrolling"
    
REASON: Many times the output to the terminal sent by a build command exceeds this limit. To understand build problems, many times you need to scroll to the beginning of the output. This enables you to scroll back to the beginning of the buffer.

-----
7. Open GEDIT and choose Preferences.
    On Editor Tab:
        Change Tab width to 4
        Check the box for "Insert spaces instead of tabs"

REASON: The default 8 spaces per tab makes reading source code difficult. 4 spaces is an acceptable convention used by industry. Changing tabs to spaces as a convention is helpful when programming in Python or any other language that relies on indentation. 

-----
8. Allow user1 to dialout on USB devices

	sudo adduser user1 dialout

REASON: This allows user1 to read and write to most serial devices such as USB. Most robotics projects require this.


-----
9. Installed helper applications

	sudo apt-get install meld minicom ant git-core gksu

-----
10. Change to default scroll bars on side windows

	gsettings set com.canonical.desktop.interface scrollbar-mode normal

REASON: This are the more familiar scrollbars and make the UI behave as many Cadets would expect it.

-----
11. Change the length of the recent opened items in gedit by typing in the terminal:

    gsettings set org.gnome.gedit.preferences.ui max-recents "uint32 30"

REASON: The default setting is too small for the number of files that are used in these projects.

------
12. Disable bluetooth on start up to conserve battery power

In the file: /etc/bluetooth/main.conf change the InitiallyPowered setting to false. It should look like this:
    
InitiallyPowered = false

REASON: We are not using the bluetooth and this conserves battery power. This can be re-enabled through the desktop gui.

--------


-----------------------------------------------------------------
ROS Kinetic Kame 
-----------------------------------------------------------------

