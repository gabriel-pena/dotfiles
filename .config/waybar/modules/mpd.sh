#!/bin/zsh
NUM_LINES=$(mpc | awk 'END{print NR}')
if [ "$NUM_LINES" -eq "3" ]; then
	MUSIC=$(mpc | awk 'NR == 1')
	echo "{\"text\":\"${MUSIC}\"}"
else
	echo "{\"text\":\"Pausado\"}"
fi
