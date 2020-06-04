#!/bin/bash

#19 quotes in total
random_nb=$(( $RANDOM % 18 + 1 ))
echo $random_nb

#pick one line in quotes file
cat quotes | head -$random_nb | tail -1
