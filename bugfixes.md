### Solutions to some problems faced on Ubuntu

#### Category 1: Display & Graphics
- Sympton 1: The Gnome Desktop does not render background images correctly. The image does not stretch the full length of the display. Also, multi-colored macro-blocks appear on the screen.
  - Solution: Open the terminal and run `sudo gsettings set org.gnome.settings-daemon.plugins.background active true`
- Sympton 2: Desktop icons are not shown on the desktop and right-clicking on the desktop has no effect.
  - Solution: `sudo gsettings set org.gnome.desktop.background show-desktop-icons true`

#### Category 2: Networking
- Sympton 1: Wireless adapter does not get enabled on boot-up. This occured after computer wakes from syspend mode or when it is improperly restarted. Toggling the hardware radio switch has no effect.
  - `rfkill unblock all` OR
  - `gksu gedit /var/lib/NetworkManager/Networkmanager.state` and change all settings to `true` OR
  - Check BIOS. Although rare, BIOS settings can prevent Wi-Fi adapter from starting up.
