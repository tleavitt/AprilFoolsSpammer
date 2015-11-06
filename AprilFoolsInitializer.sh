#Usage: . AprilFoolsInitializer.sh

. setCallNums.sh

dt=`date +%j`;
echo Script Run: $dt;
mI=0;
while [ $dt -lt 91 ] #91 is April first
do
	sleep 600;
	dt=`date +%j`;
	echo Current date: $dt;
done

hour=`date +%k`
echo Started at $hour;

#source setCallNums.sh

salute="\"message=APRIL FOOLS! Betcha can't guess who's made you this puzzle. GRIT it the key! Txt me once you figure it out\""
for num in ${Numbers[@]};
do
	echo $num
	eval "curl -X POST http://textbelt.com/text -d number=$num -d $salute"
	echo
done

. sendAprMsgs.sh
# exit 0;