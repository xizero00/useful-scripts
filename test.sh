

SERVER_IP=xxxxx
SERVER_PORT=xxx
LOCAL_PORT=1080
PASSWORD=xxxx
# sh -c 'echo 
# "#!/bin/sh -e \n
# sslocal -s $SERVER_IP -p $SERVER_PORT -l $LOCAL_PORT  -k $PASSWORD --fast-open -d start \n
# exit 0" > test'


echo "#!/bin/sh -e
sslocal -s $SERVER_IP -p $SERVER_PORT -l $LOCAL_PORT  -k $PASSWORD --fast-open -d start
exit 0" > ./conf/rc.local

sudo chown root:root ./conf/rc.local
sudo chmod +x ./conf/rc.local
sudo cp /rc.local /etc/rc.local
