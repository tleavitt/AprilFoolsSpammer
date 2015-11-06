#Usage: . sendAprMsgs.sh
#!bin/bash
#				19 20 2  10 #TUCK
#				6  17 8  19 #GRIT
#				25 1  10 3 
declare -a Code=(25 1 10 3) #T U C K

dt=`date +%k%M`
while [ $dt -lt 2000 ]
# while [ $dt -lt 2200 ]
do
	if [ "$dt" -lt 1230 ]
	then
		refrain="\"message=Spam, spam, the magical meat; the more I send, the more you eat!\""
	else
		refrain="\"message=The crpytographer Vigenere loved spam, by the way. Remember, GRIT is the key!\""
	fi

	msgTemplate="\"message=It's been TM minutes since my last text\""

	char="${Code[${mI}]}"
	sleepSec=`expr ${char} \* 60`
	#sleepSec="$char"
	echo "Sleeping for $sleepSec"
	sleep $sleepSec

	echo Sending Messages

	if [ "$mI" -eq 0 ]
	then
		for num in ${Numbers[@]};
		do
			echo $num;
			if [ "$num" -ne 0 ]
			then
				eval "curl -X POST http://textbelt.com/text -d number=$num -d $refrain"
				echo
			fi
		done
	fi

	msg="${msgTemplate/TM/$char}"

	for num in ${Numbers[@]};
	do
		echo $num;
		if [ "$num" -ne 0 ]
		then
			eval "curl -X POST http://textbelt.com/text -d number=$num -d $msg"
			echo
		fi
	done

	let "mI+=1"
	let "mI%=4"

	dt=`date +%k%M`
done
