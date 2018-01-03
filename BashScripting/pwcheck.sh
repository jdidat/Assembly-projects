#!/bin/bash

#DO NOT REMOVE THE FOLLOWING TWO LINES
git add $0 >> .local.git.out
git commit -a -m "Lab 2 commit" >> .local.git.out 
git push >> .local.git.out || echo


#Your code here
COUNT=0
pw=$(<$1)
if [ ${#pw} -gt 32 -o ${#pw} -lt 6 ]; then 
    echo "Error: Password length invalid."
    exit 1
fi
if [[ $pw =~ [#$+%@] ]]; then
    ((COUNT+=5))
fi
if [[ $pw =~ [0-9] ]]; then
    ((COUNT+=5))
fi
if [[ $pw =~ [A-Za-z] ]]; then
    ((COUNT+=5))
fi
if [[ $pw =~ [A-Z]{3,} ]]; then
    ((COUNT-=3))
fi
if [[ $pw =~ [a-z]{3,} ]]; then
    ((COUNT-=3))
fi
if [[ $pw =~ [0-9]{3,} ]]; then
    ((COUNT-=3))
fi
if egrep -q '([A-Za-z0-9])\1+' $1; then
    ((COUNT-=10))
fi
((COUNT+=${#pw})) 
echo Password Score: $COUNT

