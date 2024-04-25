#!/bin/bash
input="/mnt/src/list_src.txt" #path to the list of files to upload (.txt)
log="/mnt/src/test.txt" #path to the log file
output="/mnt/src/list_dest.txt" #path to the dest list, same as src
declare -i int=1
chars="'$'\r'" #junk chars
for int in {1..500} 
do
  ip=$(sed -n '1p' "$input" | sed "s/[$chars]//g") #reading the first line of it input list
  op=$(sed -n '1p' "$output" | sed "s/[$chars]//g") #reading the first line of it output list
  rclone copy "$ip" "$op" #uploads file to Google Drive
  echo "$int" "$ip" "$op" #verbose
  sudo echo "$ip" >> $log #log
  sudo sed -i '1d' "$input" #delete the first line of the lists
  sudo sed -i '1d' "$output"
done < "$input" 2< "$output"
