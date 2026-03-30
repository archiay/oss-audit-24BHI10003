#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Archi | Reg No: 24BHI10003
# Course: Open Source Software
# Description: Loops through key system directories and reports
#              their size, permissions, and owner

# --- Array of directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "================================================"
echo "     Disk and Permission Auditor"
echo "================================================"
echo ""

# printf gives aligned column output with fixed widths
printf "%-15s %-25s %-10s\n" "Directory" "Permissions/Owner" "Size"
echo "----------------------------------------------------------------"

# --- for loop: iterate over every directory in the array ---
for DIR in "${DIRS[@]}"; do
    # -d checks if the path exists and is a directory
    if [ -d "$DIR" ]; then
        # ls -ld shows directory info; awk extracts columns 1,3,4
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # du -sh gives human-readable size; cut extracts first field
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        # print formatted row using printf
        printf "%-15s %-25s %-10s\n" "$DIR" "$PERMS" "$SIZE"
    else
        # directory doesn't exist on this system
        echo "$DIR => Does not exist"
    fi
done

echo ""
echo "--- Git Config Check ---"

# --- Check for Git's global config file specifically ---
GIT_GLOBAL_CONFIG="$HOME/.gitconfig"

# -f checks if the path exists and is a regular file
if [ -f "$GIT_GLOBAL_CONFIG" ]; then
    echo "[✔] Git config found: $GIT_GLOBAL_CONFIG"
    # extract and display permissions and owner
    PERMS=$(ls -l "$GIT_GLOBAL_CONFIG" | awk '{print $1, $3, $4}')
    echo "Permissions: $PERMS"
else
    echo "[!] Git config not found"
fi

echo ""
echo "================================================"
