while [ 2 > 1 ]
do

if ping -c 1 www.google.com &> /dev/null
then
  echo 1
  echo "network OK"
  Status=1
  curl IPHERE/buzzOff #this command resets the buzzer

else
if [ Status < 2 ]
  echo 0
  echo "reseting network"
  curl IPHERE/ledOff #Reset Command
  Status=0
  sleep 5m
  fi
fi

if [ Status == 0 ]
then 
if ping -c 1 www.google.com &> /dev/null
then
  echo 1
  echo "network Recovered"
  mail -s "Network Recovered" email@address.com <<< "There was an event that caused the network to go down 5 minutes before this email was sent. We have successfully recovered"

  Status=1

else
  echo 0
  echo "Alerting User!"
  curl IPHERE/buzzon #enables buzzer
  Status=2
  sleep 5m
fi
fi
echo "sleeping"
sleep 2m 
done
