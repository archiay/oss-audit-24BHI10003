#!/bin/bash

STUDENT_NAME="Archi"
SOFTWARE_CHOICE="Git"

KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)
DISTRO=$(lsb_release -d | cut -f2)
CURRENT_DATE=$(date '+%d %B %Y, %H:%M:%S')

echo "=============================================="
echo " Open Source Audit — $STUDENT_NAME"
echo " Software — $SOFTWARE_CHOICE"
echo "=============================================="
echo ""
echo "OS/Distro : $DISTRO"
echo "Kernel    : $KERNEL"
echo "User      : $USER_NAME"
echo "Home Dir  : $HOME"
echo "Uptime    : $UPTIME"
echo "Date/Time : $CURRENT_DATE"
echo ""
echo "License: GNU GPL v2"

