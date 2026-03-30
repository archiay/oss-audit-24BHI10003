#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Archi | Reg No: 24BHI10003

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "================================================"
echo "     Disk and Permission Auditor"
echo "================================================"
echo ""
printf "%-15s %-25s %-10s\n" "Directory" "Permissions/Owner" "Size"
echo "----------------------------------------------------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "%-15s %-25s %-10s\n" "$DIR" "$PERMS" "$SIZE"
    else
        echo "$DIR => Does not exist"
    fi
done

echo ""
echo "--- Git Config Check ---"

GIT_GLOBAL_CONFIG="$HOME/.gitconfig"

if [ -f "$GIT_GLOBAL_CONFIG" ]; then
    echo "[✔] Git config found: $GIT_GLOBAL_CONFIG"
    PERMS=$(ls -l "$GIT_GLOBAL_CONFIG" | awk '{print $1, $3, $4}')
    echo "Permissions: $PERMS"
else
    echo "[!] Git config not found"
fi

echo ""
echo "================================================"

