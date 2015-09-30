#!/bin/sh

for i in `seq 0 99`;do
  if [ $i -lt 10 ];then
    name="0"$i
  else
    name=$i
  fi
  echo "创建目录："$name
  mkdir -p $name
  for j in `seq 0 99`;do
    if [ $j -lt 10 ];then
      childname="0"$j
    else
      childname=$j
    fi
    echo "创建子目录："$childname
    mkdir -p $name"/"$childname
  done

done
