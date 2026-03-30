#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Archi | Reg No: 24BHI10003

echo "================================================"
echo "     Open Source Manifesto Generator"
echo "================================================"
echo ""
echo "Answer three questions to generate your manifesto."
echo ""

# User input
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# Date and output file
DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

echo ""
echo "Generating your manifesto..."
echo ""

# Write manifesto to file
{
echo "========================================"
echo "  MY OPEN SOURCE MANIFESTO"
echo "  Generated on: $DATE"
echo "========================================"
echo ""
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
echo "  — $(whoami), $DATE"
echo "========================================"
} > "$OUTPUT"

# Show result
echo "Manifesto saved to $OUTPUT"
echo ""
cat "$OUTPUT"
echo ""
echo "================================================"
