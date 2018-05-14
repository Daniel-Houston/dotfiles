# Raspberry Pi Setup
1. Install Raspbian 
	* boot & hold shift (boots to recovery mode). 
	* Use dialog to install new image

2. Set default editor
```
update-alternatives --set editor /usr/bin/vim.tiny
```

2. Set up wifi (using wpa_supplicant)
	* See https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md
	* static ip address (https://www.modmypi.com/blog/how-to-give-your-raspberry-pi-a-static-ip-address-update)

2. Upgrade OS
```
sudo apt-get update
sudo apt-get dist-upgrade
```

See Also: https://www.raspberrypi.org/documentation/raspbian/updating.md

3. Reboot Pi
```
sudo shutdown -r now
```

4. disable lightdm
```
sudo systemctl set-default multi-user.target
```

See Also: https://raspberrypi.stackexchange.com/questions/31439/trying-to-turn-off-x11-in-jessie

5. Remove x11 and dependencies
```
sudo apt-get remove --auto-remove --purge 'libx11-.*'
sudo apt-get autoremove --purge #Repeat until no orphans remain.
```
 
See https://raspberrypi.stackexchange.com/questions/4745/how-to-uninstall-x-server-and-desktop-manager-when-running-as-headless-server

6. Install go
Go to the [Go download site](https://golang.org/dl/) and download the armv6 binary. Follow the installation instructions 
```
tar -C /usr/local -xzf <go tar.gz download>
```

add /usr/local/go/bin to your PATH

7. Add users
See https://www.raspberrypi.org/documentation/linux/usage/users.md

To add sudoers instead Use
```
sudo visudo -f /etc/sudoers.d/sudoers
```
