#!/bin/bash
# creates a queue from command line arguments randomly
#
# SYNOPSYS
# lineup [...args]
#
# All args are returned in a random order. No arg is repeated.

LIST=$@

for i in `seq $# 1`;
do
  _N=$(awk "BEGIN { srand(); print int(rand() * $i + 1) }")
  SELECTION=$(echo $LIST | cut -d " " -f $_N)
  LINEUP="$LINEUP $SELECTION"
  LIST=$(echo $LIST | sed "s/$SELECTION//")
done

echo $LINEUP
