#!/bin/bash

# Last Edit: 23/03/2018
# Liam Kelly - Bede Gaming Task 2
# Version 0.1
# If a user is deleted then it is automatically re-created

# Variables
directory=/home/bede-user/application/logging/
user=bede-user
group=bede-group

while (inotifywait -e attrib $directory) do
  chown $user:$group $directory
  chmod 774 $directory
  echo "Directory permissions reset. Do not change permissions, this is required for the application to run." | wall
done
