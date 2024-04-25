#!/bin/bash
int=1
input="/mnt/src/list_src.txt"
log="/mnt/src/test.txt"
output="/mnt/src/list_dest.txt"
chars="'$'\r'"
len=($(wc "$input"))
echo "Lines in input file: $len" 
for int in $(seq 1 $len)
do
  ip=$(sed -n '1p' "$input" | sed "s/[$chars]//g")
  op=$(sed -n '1p' "$output" | sed "s/[$chars]//g")
  echo -n "$int Uploading $ip to $op ...  "
  rclone copy "$ip" "$op"
  sudo echo "$ip" >> $log
  echo "SUCCESS!"
  sudo sed -i '1d' "$input"
  sudo sed -i '1d' "$output"
done < "$input" 2< "$output"
