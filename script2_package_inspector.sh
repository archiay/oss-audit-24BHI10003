#!/bin/bash

PACKAGE="git"

echo "================================================"
echo "     FOSS Package Inspector"
echo "================================================"
echo ""

if dpkg -l | grep -q "^ii  $PACKAGE"; then
    echo "[✔] $PACKAGE is installed on this system."
    echo ""
    echo "--- Package Details ---"
    dpkg -l | grep "^ii  $PACKAGE" | awk '{print "  Version : " $3}'
    apt-cache show "$PACKAGE" | grep -E "^Version|^License|^Description" | head -5
else
    echo "[✘] $PACKAGE is NOT installed."
    echo "Install it with: sudo apt install $PACKAGE"
fi

echo ""
echo "--- Open Source Philosophy Note ---"

case $PACKAGE in
    git)
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
        echo "$PACKAGE: Open source software." ;;
esac

echo ""
echo "================================================"
