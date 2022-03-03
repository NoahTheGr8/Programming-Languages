#!/bin/bash

read -p "Please enter codebook text file: " codebook #mini-codebook.txt | codebook-sr.txt  | codebook-tmbg.txt
read -p "Please enter fishy text file: " fishyfile   #mini-fishlist.txt | innocuous-sr.txt | innocuous-tmbg.txt

#1) Save only the SKU's into their own file
echo | awk '{print $2}' $fishyfile | sort -t- -nk1 > SKUs.txt

#1) Sorts the SKU's 2)Looks at left part of SKU and keeps odd ones 3) Adds 3 to the right value 4) turn the right side number to ASCII char 5) save it into a file
echo | awk -F "-" '{print $1, $2}' SKUs.txt | awk '{if($1%2==1){print $1,$2;}}' | awk '{print $1 ,$2 + 3}' | awk 'BEGIN{for(n=0;n<256;n++)chr[n]=sprintf("%c",n)}{print chr[$2]}' > semideciphered.txt

#Puts the codebook into a hashtable/dictionary and prints them out - FOR DEBUGGING ONLY
#awk 'FNR==NR {a[$1] = $2; next} END {for (key in a) { print key, a[key] , $2 } }' codebook-sr.txt semideciphered.txt

echo "------------------- Hidden Message Below -------------------"

#1) puts the codebook into a dictionary then prints the decoded message using that dictionary 2) put into 1 line
echo | awk 'FNR==NR {a[$1] = $2; next} {print a[$1]}' $codebook semideciphered.txt | awk 'NR{printf "%s",$0;next;}1'