#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Archi | Reg No: 24BHI10003
# Course: Open Source Software
# Description: Asks the user 3 questions interactively and writes
#              a personalised open source philosophy statement to a file

# --- Note on aliases (shell concept) ---
# An alias is a custom shortcut for a command, defined in a shell session.
# Example: alias today='date +%d-%B-%Y'
# Aliases cannot be used inside scripts (they only work in interactive shells)
# so we use the date command directly below instead.

echo "================================================"
echo "     Open Source Manifesto Generator"
echo "================================================"
echo ""
echo "Answer three questions to generate your manifesto."
echo ""

# --- read: gather user input interactively from the terminal ---
# -p flag shows a prompt before waiting for input
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# --- date command with format string for readable output ---
DATE=$(date '+%d %B %Y')

# --- output filename includes current username via $() substitution ---
OUTPUT="manifesto_$(whoami).txt"

echo ""
echo "Generating your manifesto..."
echo ""

# --- Write manifesto to file using output redirection ---
# { } groups multiple echo commands; > redirects into the file
{
    echo "========================================"
    echo "  MY OPEN SOURCE MANIFESTO"
    echo "  Generated on: $DATE"       # string concatenation with variable
    echo "========================================"
    echo ""
    # Variables $TOOL, $FREEDOM, $BUILD interpolated into strings
    echo "Every day, I rely on $TOOL — a tool built not for profit,"
    echo "but out of a belief that knowledge and code should be free."
    echo "To me, freedom means $FREEDOM. It is the same freedom that"
    echo "drives developers around the world to share their work openly."
    echo ""
    echo "One day, I will build $BUILD and release it as open source,"
    echo "because the tools I use today exist because someone before me shared theirs."
    echo ""
    echo "Open source is not just a license. It is a way of thinking."
    echo ""
    echo "  — $(whoami), $DATE"    # $(whoami) substituted at runtime
    echo "========================================"
} > "$OUTPUT"   # single > creates/overwrites the file

# --- Display confirmation and print the saved file ---
echo "Manifesto saved to $OUTPUT"
echo ""
cat "$OUTPUT"   # cat prints file contents to terminal
echo ""
echo "================================================"
