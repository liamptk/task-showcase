#!/bin/bash

# Last Edit: 23/03/2018
# Liam Kelly - Bede Gaming Task 2
# Version 0.1
# If a user is deleted then it is automatically re-created

# Variables
user=bede-user
group=bede-group

while (inotifywait -e close_write /etc/group) do
    sleep 3
    groupExists=$(grep -c ''$group':' /etc/group)
    if [ $groupExists -eq 0 ]
    then
      sudo groupadd $group
      sudo usermod -a -G $group $user
    fi
done
