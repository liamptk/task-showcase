#!/bin/bash

# Last Edit: 23/03/2018
# Liam Kelly - Bede Gaming Task 2
# Version 0.1
# If a user is deleted then it is automatically re-created

# Variables
user=bede-user
group=bede-group
homeDirectory=/home/$user
defaultTerminal=/bin/bash

while (inotifywait -e close_write /etc/passwd) do
    sleep 3
    userExists=$(grep -c ''$user':' /etc/passwd)
    if [ $userExists -eq 0 ]
    then
      sudo useradd -g $group -d $homeDirectory -s $defaultTerminal $user
      sudo chown -R $user:$group $homeDirectory
    fi
done
