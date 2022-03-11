#!/bin/sh

if [ -f "/root/.wine/drive_c/Program Files/AirPort/APUtil.exe" ] ; then
	# installed, run it
	wine "/root/.wine/drive_c/Program Files/AirPort/APUtil.exe"
else
	# not installed yet, install it
	wine "/app/AirPortSetup.exe"
fi
