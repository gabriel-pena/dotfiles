#!/bin/zsh
MUSIC=$(mpc | awk 'NR == 1')
echo "{\"text\":\"${MUSIC}\"}"
