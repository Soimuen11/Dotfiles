#!/bin/bash
# ==================================================
# |\			/| '		 '	============	
# ||\		   /|| ''        ' /  ______    \
# || \		  / || ' '       ' | |		 |	|
# ||  \		 /  || '  '      ' | |   	 |  |
# ||   \	/   || '   '     ' | |       |  |
# ||    \  /    || '    '    ' | |       |  |
# ||	 \/     || '	 '   ' | |       |  |
# ||			|| '      '  ' | |       |  |
# ||			|| '       ' ' | | 		 |  |
# ||			|| '        '' \  \=====/ QQQQ      
# ||			|| '         '  \_________/QQQQQQ
#Welcome to Mystery Number Quest			QQQQQQ
#===================================================
#You can choose the level of difficulty as a parameter
#when starting the game. Like so :
# ./mystery --easy 
#You may also choose normal, hard, extreme, hardcore and insane.


#default range
range=100
if [[ $1 = "--easy" ]]
	then range=10
elif [[ $1 = "--normal" ]]
	then range=100
elif [[ $1 = "--hard" ]]
	then range=1000
elif [[ $1 = "--extreme" ]]
	then range=10000
elif [[ $1 = "--hardcore" ]]
	then range=100000
elif [[ $1 = "--insane" ]]
	then range=1000000
fi
echo "the number you are looking for is b/w 1 & $range"

mystery=$((1 + RANDOM % $range))
counter=1

while [[ $number -ne $mystery ]]
do
read -p "Enter a number: " number
if [[ $number -gt $mystery ]]
	then echo "it is less"
elif [[ $number -lt $mystery ]]
	then echo "it is more"
elif [[ $number == "" ]]
	then echo "enter a number, not a string"
fi
counter=$(($counter + 1))
done
echo "well done, you found me"
echo "you needed $counter shots"
exit 0
