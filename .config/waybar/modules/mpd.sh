#!/bin/zsh
NUM_LINES=$(mpc | awk 'END{print NR}')
if [ "$NUM_LINES" -eq "3" ]; then
	MUSIC=$(mpc | awk 'NR == 1')
	PERC=$(mpc | awk 'NR == 2' | awk '{print substr($4,2,length($4)-3);}')
	echo "{\"text\":\"${MUSIC}\",\"class\":[\"active\",\"${PERC}\"]}"
else
	echo "{\"text\":\"Parado\"}"
fi
