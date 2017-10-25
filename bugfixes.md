### Solutions to some problems faced on Ubuntu

#### Category 1: Display & Graphics
- Sympton 1: The Gnome Desktop does not render background images correctly. The image does not stretch the full length of the display. Also, multi-colored macro-blocks appear on the screen.
  - Solution: Open the terminal and run `sudo gsettings set org.gnome.settings-daemon.plugins.background active true`
- Sympton 2: Desktop icons are not shown on the desktop and right-clicking on the desktop has no effect.
  - Solution: `sudo gsettings set org.gnome.desktop.background show-desktop-icons true`
- Symptom 3: Display freezes and only option is to perform a hard shutdown.
  - Solution: Modify and Update grub. *DO THIS ONLY IF YOU FACE ISSUES WITH THE DISPLAY FREEZING*[[1]](http://askubuntu.com/questions/761706/ubuntu-15-10-and-16-04-keep-freezing-randomly)
  - `sudo nano /etc/default/grub`
  - Modify the line GRUB_CMDLINE_LINUX_DEFAULT = "quiet splash intel_idle.max_cstate=1"
  - `sudo update-grub`
  - `sudo reboot`
  - *REASON: This is to prevent the screen from freezing after a few minutes of inactivity. This problem was faced multiple times during installation and the computer had to be hard rebooted in order to recover. This seems to be a major bug in the display driver affecting multiple users of 15.10 & 16.04. Ubuntu is working to resolve it.* 
- Symptom 4: Suspend/Hibernate on Lid close [[1]](http://askubuntu.com/questions/827139/closing-lid-turns-off-external-monitor-on-16-04) [[2]](http://askubuntu.com/questions/15520/how-can-i-tell-ubuntu-to-do-nothing-when-i-close-my-laptop-lid) 
  - Solution : 
   - `gksu gedit /etc/systemd/logind.conf`
   - Uncomment (Remove '#') the line `HandleLidSwitch=suspend` and change it to `HandleLidSwitch=ignore`
   - Uncomment the line `HandleLidSwitchDocked=ignore`.
   - Save, exit and reboot.
   - *REASON: On some machines, the computer suspends on closing the lid. This is inspite of changing the settings in 'System Settings -> Power -> 'Do nothing when lid is closed'. Found this work around to be useful when using multiple displays through a docking station. The systems suspends soon after boot-up by detecting that the lid is closed, before it detects the secondary displays.*
#### Category 2: Networking
- Sympton 1: Wireless adapter does not get enabled on boot-up. This occured after computer wakes from syspend mode or when it is improperly restarted. Toggling the hardware radio switch has no effect.
  - `rfkill unblock all` OR
  - `gksu gedit /var/lib/NetworkManager/Networkmanager.state` and change all settings to `true` OR
  - Check BIOS. Although rare, BIOS settings can prevent Wi-Fi adapter from starting up.
