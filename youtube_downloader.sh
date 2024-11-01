#!/bin/bash

if ! comand -v yt-dlp &> /dev/null; then
    echo "yt-dlp could not be found. Please install it first"
    exit 1
fi

PLAYLIST_URL = "$1"
LOGFILE = "download_log.txt"

if [ -z "$PLAYLIST_URL" ]; then
    echo "Usage: $0 <playlist url>"
    exit 1
fi

{
    echo "==========================================="
    echo "Download started: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Paylist URL: $PLAYLIST_URL"
} >> "$LOGFILE"

yt-dlp -o "%(title)s.%(ext)s" "$PLAYLIST_URL" >> "$LOGFILE" 2>&1

echo "Download completed : $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOGFILE"
echo "===========================================" >> "$LOGFILE"

echo "Download log saved to $LOGFILE"