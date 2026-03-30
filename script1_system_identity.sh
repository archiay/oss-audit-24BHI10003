#!/bin/bash
# Script 1: System Identity Report
# Author: Archi Israni | Reg No: 24BHI10003
# Course: Open Source Software
# Description: Displays a welcome screen with key Linux system information

# --- Student and project variables ---
STUDENT_NAME="Archi"
SOFTWARE_CHOICE="Git"

# --- Gather live system info using command substitution $() ---
KERNEL=$(uname -r)        # get kernel version
USER_NAME=$(whoami)       # get current logged-in username
UPTIME=$(uptime -p)       # human-readable uptime
DISTRO=$(lsb_release -d | cut -f2)   # distro name, cut removes the label
CURRENT_DATE=$(date '+%d %B %Y, %H:%M:%S')  # formatted date and time

# --- Print formatted output using echo ---
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
# --- License note: Linux kernel runs under GPL v2 ---
echo "License: GNU GPL v2"
