#!/bin/bash

# Last Edit: 23/03/2018
# Liam Kelly - Bede Gaming Task 2
# Version 0.1
# If a user is deleted then it is automatically re-created

# Variables
directory=/home/bede-user/application/logging/

while (inotifywait -e delete_self $directory) do
        mkdir $directory && chown bede-user:bede-group $directory && chmod 774 $directory && echo"Directory recreated. Do not delete, this is required for logging." | wall
done
