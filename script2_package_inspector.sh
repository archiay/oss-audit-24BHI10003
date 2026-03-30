#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Archi Israni | Reg No: 24BHI10003
# Course: Open Source Software
# Description: Checks if a FOSS package is installed and prints
#              its details along with a philosophy note

# --- Package to inspect ---
PACKAGE="git"

echo "================================================"
echo "     FOSS Package Inspector"
echo "================================================"
echo ""

# --- if-then-else: check if package exists in dpkg database ---
# dpkg -l lists installed packages; grep -q returns true if found
if dpkg -l | grep -q "^ii  $PACKAGE"; then
    echo "[✔] $PACKAGE is installed on this system."
    echo ""
    echo "--- Package Details ---"
    # pipe dpkg output through awk to extract version field ($3)
    dpkg -l | grep "^ii  $PACKAGE" | awk '{print "  Version : " $3}'
    # apt-cache show gives full metadata; grep filters key fields
    apt-cache show "$PACKAGE" | grep -E "^Version|^License|^Description" | head -5
else
    # package not found — print install instructions
    echo "[✘] $PACKAGE is NOT installed."
    echo "Install it with: sudo apt install $PACKAGE"
fi

echo ""
echo "--- Open Source Philosophy Note ---"

# --- case statement: prints a note based on the package name ---
case $PACKAGE in
    git)
        # Git's origin story in one line
        echo "Git: Created by Linus Torvalds when proprietary tools failed him."
        echo "A symbol of how open source solves real problems." ;;
    httpd|apache2)
        echo "Apache: The web server that built the open internet." ;;
    mysql)
        echo "MySQL: Powering millions of applications." ;;
    vlc)
        echo "VLC: Free media player for all formats." ;;
    firefox)
        echo "Firefox: Keeping the web open and private." ;;
    python3)
        echo "Python: Community-driven programming language." ;;
    *)
        # default case for any other package
        echo "$PACKAGE: Open source software." ;;
esac

echo ""
echo "================================================"
