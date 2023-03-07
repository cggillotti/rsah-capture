#!/bin/bash

echo $$ > /var/run/$1.pid

echo "Starting Controller"
START=$(/bin/date +%s)
CURRENT=-1

#target-time=7210
MAXTIME=7210
echo $$ > /var/run/$1.pid

WORKER=$(cat /var/run/$1.pid)
echo WORKER
echo "Work spawn $WORKER"

#sleep 10
#exec "$@"
$@ $1 & > /dev/null
TARGET="$!"
echo "Spawned: $TARGET"
while [ "$CURRENT" -lt "$MAXTIME" ]
do
echo "looping: $CURRENT of $MAXTIME"
NOW=$(/bin/date +%s)
CURRENT=$(($NOW - $START))
sleep 1
done
echo "Killing process $TARGET"
kill -9 $WORKER
kill -9 $TARGET
killall curl
exit

