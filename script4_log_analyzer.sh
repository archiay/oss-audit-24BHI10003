#!/bin/bash
# Script 4: Log File Analyzer
# Author: Archi | Reg No: 24BHI10003

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0

echo "================================================"
echo "     Log File Analyzer"
echo "================================================"
echo ""

ATTEMPTS=0
while [ ! -f "$LOGFILE" ] && [ $ATTEMPTS -lt 3 ]; do
    if [ -z "$LOGFILE" ]; then
        echo "[!] No log file provided."
    else
        echo "[!] File '$LOGFILE' not found."
    fi
    read -p "Enter valid log file path: " LOGFILE
    ATTEMPTS=$((ATTEMPTS + 1))
done

if [ ! -f "$LOGFILE" ]; then
    echo "[✘] File not found. Exiting."
    exit 1
fi

echo "[✔] Scanning: $LOGFILE"
echo "Keyword: $KEYWORD"
echo ""

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "--------------------------------"
echo "Keyword '$KEYWORD' found: $COUNT times"
echo "--------------------------------"
echo ""

echo "--- Last 5 matching lines ---"
grep -i "$KEYWORD" "$LOGFILE" | tail -5

echo ""
echo "================================================"
