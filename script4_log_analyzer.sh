#!/bin/bash
# Script 4: Log File Analyzer
# Author: Archi | Reg No: 24BHI10003
# Course: Open Source Software
# Description: Reads a log file line by line, counts keyword matches,
#              and prints a summary with the last 5 matching lines
# Usage: ./script4_log_analyzer.sh /var/log/syslog error

# --- Accept log file path and keyword as command-line arguments ---
LOGFILE=$1                  # first argument: path to log file
KEYWORD=${2:-"error"}       # second argument: keyword (defaults to "error")
COUNT=0                     # counter variable starts at zero

echo "================================================"
echo "     Log File Analyzer"
echo "================================================"
echo ""

# --- Retry loop: ask for valid file if not provided or not found ---
# while loop keeps running as long as file doesn't exist (max 3 tries)
ATTEMPTS=0
while [ ! -f "$LOGFILE" ] && [ $ATTEMPTS -lt 3 ]; do
    # -z checks if variable is empty (no argument given)
    if [ -z "$LOGFILE" ]; then
        echo "[!] No log file provided."
    else
        echo "[!] File '$LOGFILE' not found."
    fi
    # read prompts user to enter a new path interactively
    read -p "Enter valid log file path: " LOGFILE
    ATTEMPTS=$((ATTEMPTS + 1))   # increment attempt counter
done

# --- Exit cleanly if still no valid file after 3 attempts ---
if [ ! -f "$LOGFILE" ]; then
    echo "[✘] File not found. Exiting."
    exit 1   # exit with error code 1
fi

echo "[✔] Scanning: $LOGFILE"
echo "Keyword: $KEYWORD"
echo ""

# --- while read loop: process the file one line at a time ---
# IFS= prevents whitespace stripping; -r prevents backslash interpretation
while IFS= read -r LINE; do
    # if-then inside loop: grep -iq does case-insensitive silent match
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # increment match counter
    fi
done < "$LOGFILE"   # redirect file into the while loop

# --- Print summary ---
echo "--------------------------------"
echo "Keyword '$KEYWORD' found: $COUNT times"
echo "--------------------------------"
echo ""

# --- Show last 5 matching lines using grep piped to tail ---
echo "--- Last 5 matching lines ---"
grep -i "$KEYWORD" "$LOGFILE" | tail -5

echo ""
echo "================================================"
