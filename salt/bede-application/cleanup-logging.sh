#!/bin/sh

# Last Edit: 23/03/2018
# Liam Kelly - Bede Gaming Task 1
# Version 0.2
# Calculates disk space consumed by application logs and compares it against the file systems remaining disk space
# If logging consumes more than 20% of disk space, logs older than 7 days are deleted

df -m | grep -vE 'Filesystem|tmpfs|cdrom|udev' | awk '{ print $5 " " $1 " " $2 }' | while read output;
do

  # Variables
  diskUsagePercentage=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  fileSize=$(echo $output | awk '{ print $3 }' )
  loggingDiskUsage=$(du -m /home/user/test/ | cut -f -1)
  loggingDiskUsagePercentage=$(awk "BEGIN { pc=100*${loggingDiskUsage}/${fileSize}; i=int(pc); print (pc-i<0.5)?i:i+1 }")
  loggingDirectory=/home/bede-user/application/logging/

  # If disk usage is higher than 90%
  if [ $diskUsagePercentage -ge 90 ]; then
    echo "Running out of space on \"$partition (currently using $diskUsagePercentage%)\" on $(hostname) as on $(date)"
    echo "Currently logging is consuming $loggingDiskUsage(mb)($loggingDiskUsagePercentage%) of $fileSize(mb)"

    # If logging is consuming more than 20% of disk space delete logs older than 7 days
    if [ "$loggingDiskUsagePercentage" -ge 20 ]
    then
      find $loggingDirectory -type f -mtime +7 -print0 | xargs -r0 rm --
      echo "Deleted logging files older than 7 days"
    else
      echo "Logging is not consuming all of your disk"
    fi

  else
    echo "Partition $partition is only using $diskUsagePercentage%"
  fi

done
