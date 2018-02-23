#Daler_Rustamov_Assignment 4

#the UID 
UID_KILL=1001

#the time in seconds which the process is allowed to run
KILL_TIME=3 #one hour

KILL_LIST=`{
ps -eo uid,pid,lstart | tail -n+2 |
while read PROC_UID PROC_PID PROC_LSTART; do
SECONDS=$[$(date +%s) - $(date -d"$PROC_LSTART" +%s)]
	if [ $PROC_UID -eq $UID_KILL -a $SECONDS -gt $KILL_TIME ]; then
	   	echo -n "$PROC_PID "
	   	fi
	done 
	}`

		if [[ -n $KILL_LIST ]]
		then
	        kill $KILL_LIST
	fi
