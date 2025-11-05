#!/bin/bash

# Create logs directory if it doesn't exist
mkdir -p logs

# Disk usage report
df -h > logs/disk_usage.txt
du -sh /var/* > logs/directory_usage.txt

# Process usage report (top memory consumers)
ps aux --sort=-%mem | head > logs/top_memory_processes.txt

# CPU and memory report using nmon
nmon -f -s 10 -c 6  # Generates a .nmon file in current directory
mv *.nmon logs/

echo "Reports generated in ./logs and current directory (nmon file)"
