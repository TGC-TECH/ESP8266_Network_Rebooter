#!/bin/bash

while [ 2 > 1 ]
do

if ping -c 1 www.google.com &> /dev/null
then
  echo 1
  echo "network OK"

else
  echo 0
  echo "reseting network"
  curl IPHERE/ledOff #Reset Command
  sleep 5m
  fi

echo "sleeping"
sleep 2m 
done
