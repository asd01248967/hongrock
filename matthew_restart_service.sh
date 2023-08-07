#!/bin/bash

# Step 1: Kill all Python processes using netstat and kill command
echo "Killing all Python processes"
for PID in $(netstat -ntlp | grep python | awk '{print $7}' | sed 's|/.*||'); do
  echo "Killing process with ID $PID"
  kill -9 $PID
done

# Step 2: Change to the specified directory
echo "Changing directory to /web/A05/machine_learn/WebRoot/vip-machine-learning/"
cd /web/A05/machine_learn/WebRoot/vip-machine-learning/

# Step 5: Remove the specified files and directories
echo "Removing files and directories"
rm -rf nohup.out README.md setup.py viplearning vip-machine-learning.7z .gitignore

# Step 4: Move the 7z archive to the specified directory
echo "Moving vip-machine-learning.7z to /web/A05/machine_learn/WebRoot/vip-machine-learning/"
mv /tmp/vip-machine-learning.7z /web/A05/machine_learn/WebRoot/vip-machine-learning/vip-machine-learning.7z

# Step 3: Extract the 7z archive
echo "Extracting vip-machine-learning.7z"
echo "Y" | 7z x /web/A05/machine_learn/WebRoot/vip-machine-learning/vip-machine-learning.7z

# Step 6: Install the required dependencies
echo "Installing dependencies"
pip3.8 install /web/A05/machine_learn/WebRoot/vip-machine-learning/
sleep 3

# Step 7: Start the first server and wait for 3 seconds
echo "Starting server on port 8080"
nohup vip-server prod 8080 &
sleep 3

# Step 8: Start the second server and wait for 3 seconds
echo "Starting server on port 8081"
nohup vip-server prod 8081 &
sleep 3

# Step 9: Check the running processes
echo "Checking running processes"
netstat -ntlp

echo "All done!"
