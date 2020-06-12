#!/bin/bash

random_nb=$(( $RANDOM % 60 ))
#pick one line in quotes file
cat ~/.local/scripts/quote_generator/quotes | head -$random_nb | tail -1
