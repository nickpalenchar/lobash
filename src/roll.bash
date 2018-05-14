#!/bin/bash

# SYNOPSIS
#
# roll [<num>]d<sides>
# roll [<num>]
# 
# DESCRIPTION
# rolls a number of n-sided dice

random() {

  local N=$1
  echo $(( RANDOM % N + 1 ))
}


COUNT=$(echo $1 | sed 's/^\([0-9]*\).*/\1/' )
SIDES=$(echo $1 | sed 's/[0-9]*d\([0-9]*\).*/\1/' )

[[ -z $COUNT ]] && COUNT=1
[[ -z $SIDES ]] && SIDES=6

TOTAL=0
ROLLS=''
for i in `seq 1 $COUNT`
do
  DICEROLL=$(random $SIDES)
  (( TOTAL += DICEROLL ))
  ROLLS="$ROLLS $DICEROLL"
done

echo "You rolled *$TOTAL*"
echo "Dice   rolls"
echo "${COUNT}d${SIDES}   ${ROLLS}"
