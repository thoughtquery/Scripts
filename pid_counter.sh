#!/bin/bash

########################################
## Count you some PIDS and number them
########################################


# Lets grab us some pids, shall we?
PIDS=`ps aux | awk '{print $2}'`
HOW_MANY=`ps aux | awk '{print $2}' | wc -l`

echo "Hi Friend!"
echo "So far we've got ${HOW_MANY} processes running"
printf "\n"
printf "Lets count them!"
printf "\n\n\n"

# Counter var
C=1

# Loop through pids and 
for pid in $PIDS; do
	echo "the ${C}'st PID is : $pid"
	# Update counter var
	((C++))
done
