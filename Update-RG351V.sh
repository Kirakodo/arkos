#!/bin/bash
clear

UPDATE_DATE="04172021"
LOG_FILE="/home/ark/update$UPDATE_DATE.log"
UPDATE_DONE="/home/ark/.config/.update$UPDATE_DATE"

if [ -f "$UPDATE_DONE" ]; then
	LD_LIBRARY_PATH=/usr/local/bin msgbox "No more updates available.  Check back later."
	rm -- "$0"
	exit 187
fi

if [ -f "$LOG_FILE" ]; then
	sudo rm "$LOG_FILE"
fi

c_brightness="$(cat /sys/devices/platform/backlight/backlight/backlight/brightness)"
sudo chmod 666 /dev/tty1
echo 255 > /sys/devices/platform/backlight/backlight/backlight/brightness
touch $LOG_FILE
tail -f $LOG_FILE >> /dev/tty1 &

if [ ! -f "/home/ark/.config/.update04112021" ]; then

	printf "\nChange kernel and dtb\nUpdate ogage\nUpdate perfmax to not remove .asoundrc\nUpdate dreamcast.sh atomiswave.sh naomi.sh openborkeydemon.py ppssppkeydemon.py solarushotkeydemon.py pico8keydemon.py ti99keydemon.py\nUpdated Switch to SD2 for Roms.sh and Switch to main SD for Roms.sh\nRemove rg351_gpio.sh from crontab" | tee -a "$LOG_FILE"
	sudo wget --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/04112021/rg351v/arkosupdate04112021.zip -O /home/ark/arkosupdate04112021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate04112021.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate04112021.zip" ]; then
		sudo unzip -X -o /home/ark/arkosupdate04112021.zip -d / | tee -a "$LOG_FILE"
		sudo depmod 4.4.189
		sudo rm -v /home/ark/arkosupdate04112021.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS OaD (Test Release 1.1)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04112021"
fi

if [ ! -f "/home/ark/.config/.update04132021" ]; then

	printf "\nUpdate wifi.sh network info.sh change password.sh to fix no controls from last kernel change\nFix potential Daphne, TI99, and SCUMMVM not launching issue\nFixed PPSSPP reversed analog menu controls\n" | tee -a "$LOG_FILE"
	sudo wget --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/04132021/rg351v/arkosupdate04132021.zip -O /home/ark/arkosupdate04132021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate04132021.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate04132021.zip" ]; then
		sudo unzip -X -o /home/ark/arkosupdate04132021.zip -d / | tee -a "$LOG_FILE"
		sudo rm -v /home/ark/arkosupdate04132021.zip | tee -a "$LOG_FILE"
	    if [ -f "/opt/system/Advanced/Switch to main SD for Roms.sh" ]; then
		  sudo cp -f -v "/usr/local/bin/Switch to main SD for Roms.sh" "/opt/system/Advanced/Switch to main SD for Roms.sh" | tee -a "$LOG_FILE"
		else
		  sudo cp -f -v "/usr/local/bin/Switch to SD2 for Roms.sh" "/opt/system/Advanced/Switch to SD2 for Roms.sh" | tee -a "$LOG_FILE"
		fi
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS OaD (Test Release 1.2)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04132021"
fi

if [ ! -f "/home/ark/.config/.update04152021" ]; then

	printf "\nUpdate scummvm to fix AGS not loading\nUpdate perfmax and perfnorm scripts to fix screen flashing issue on loading and returning from games.\nUpdate Emulationstation to not use Batocera's scraping ID\n" | tee -a "$LOG_FILE"
	sudo wget --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/04152021/rg351v/arkosupdate04152021.zip -O /home/ark/arkosupdate04152021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate04152021.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate04152021.zip" ]; then
		sudo unzip -X -o /home/ark/arkosupdate04152021.zip -d / | tee -a "$LOG_FILE"
		sudo rm -v /home/ark/arkosupdate04152021.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS OaD (Test Release 1.3)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04152021"
fi

if [ ! -f "/home/ark/.config/.update04162021" ]; then

	printf "\nUpdate to add support for launching retrorun Dreamcast in 640 mode by holding A\nFix no controls for retrorun saturn\nUpdated libgo2.so libs\nUpdate Enable Remote Services script to show assigned IP and 5s pause\n" | tee -a "$LOG_FILE"
	sudo wget --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/04162021/rg351v/arkosupdate04162021.zip -O /home/ark/arkosupdate04162021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate04162021.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate04162021.zip" ]; then
		sudo unzip -X -o /home/ark/arkosupdate04162021.zip -d / | tee -a "$LOG_FILE"
        if [ ! -f "/opt/system/Advanced/Switch to main SD for Roms.sh" ]; then
           sudo sed -i '/roms2\//s//roms\//g' /usr/local/bin/dreamcast.sh
		fi
		sudo rm -v /home/ark/arkosupdate04162021.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS OaD (Test Release 1.4)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04162021"
fi

if [ ! -f "$UPDATE_DONE" ]; then

	printf "\nFix issue with being able to consistently launch dreamcast in 640x480\n" | tee -a "$LOG_FILE"
	sudo sed -i '/#!\/bin\/bash/s//#!\/bin\/bash\n\nsudo chmod 666 \/dev\/tty1/' /usr/local/bin/dreamcast.sh
	
	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS OaD (Test Release 1.5)" /usr/share/plymouth/themes/text.plymouth

	touch "$UPDATE_DONE"
	rm -v -- "$0" | tee -a "$LOG_FILE"
	printf "\033c" >> /dev/tty1
	LD_LIBRARY_PATH=/usr/local/bin msgbox "Updates have been completed.  System will now restart after you hit the A or B button to continue.  If the system doesn't restart after pressing A, just restart the system manually."
	echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
	sudo reboot
	exit 187	
fi
