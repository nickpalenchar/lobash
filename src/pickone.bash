#!/bin/bash
#
# SYNOPSYS
#
# pickone [...items]
#
# Will randomly pick one item and write to stdout. If no items are supplied, a zero-string is output.

SELECTED=$(awk "BEGIN { srand();print int(rand() * $#) }")
((SELECTED++))
echo "${!SELECTED}"
