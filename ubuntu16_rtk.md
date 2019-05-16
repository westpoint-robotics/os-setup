#### 1. Install Google Chrome stable from a repo
- `wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -`
- `echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list`
- `sudo apt-get update` 
- `sudo apt-get install google-chrome-stable`

#### 2. Install additional tools
- `sudo apt-get install meld minicom ant git gitk gksu openssh-server terminator gparted git-core python-argparse python-wstool python-vcstools build-essential gedit-plugins` 

#### 3. Extend length of History
- In the ~/.bashrc file change the below settings to lengthen the history file. Just add a couple zero’s to each setting.
- HISTSIZE=100000
- HISTFILESIZE=200000

#### 4. Modify Power Saving
- Go to System Settings -> All Settings -> Brightness & Lock
- Check 'Dim screen to save power'
- Set "Turn screen off when inactive for: Never"
- Disable screen lock

#### 5. Edit Terminal's Default Profile
- Open Terminal. Click on Edit -> Profile Preferences
- On the Scrolling tab, uncheck the box "Limit scrollback to:"

#### 6. GEDIT Preferences.
- Open a text file using Gedit or type `gedit` in a terminal window and hit enter. This brings up the text editor.
- Click Edit -> Preferences -> Editor. 
- Change Tab width to 4 , Check the box for "Insert spaces instead of tabs"
- Enable block commenting. Click Edit -> Preferences -> Plugins, and check the box for "Code Comment"
- Enable highlight matching brackets. Click Edit -> Preferences -> View, and check the box for "Highlight matching brackets"

#### 7. Allow user1 to dialout on USB devices
 - `sudo adduser user1 dialout`
 
#### 8. Setup git
- `git config --global user.email "dominic.larkin@westpoint.edu"`
- `git config --global user.name "User1 Nuvo"`
- `git config --global push.default simple`
- `git config --global credential.helper "cache --timeout=60000"`

#### 9. Setup DI2E access with keys
- Add the public key to the computers known-hosts. 
    - Copy the public key to ~/.ssh and cd into that directory:
        `cd ~/.ssh`
    - Set proper permission for key:
        `chmod 600 bitbucket_id_rsa`
    - Add key to knownhosts
        `ssh-add bitBucket_id_rsa`
        
#### 10. Clone this repo from DI2E bitbucket:
- `git clone ssh://git@bitbucket.di2e.net:7999/rtk/configuration.git`
- `cd ~/configuration`
- `./setup_workspace.sh`
    - Note: If the credential times out you will get errors for the repos that could not clone. If this happens reload you credentials and run the script again. `ssh-add bitBucket_id_rsa`
- `cd $HOME/code/rtk`
- `catkin build`
    

