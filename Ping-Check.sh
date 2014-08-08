#!/bin/bash

### 変数
NUM4=$2

### Ping応答実行
while [ ${NUM4} -le $3 ]
do
  RES=`ping $1.${NUM4} -c 1 -w 1 | tail -n2 | head -n1 | cut -d" " -f6 | sed "s/\%//g"`

  if [ ${RES} = "0" ];
     then
         echo "$1.${NUM4} Ping ◯"
     else
         echo "$1.${NUM4} Ping ×"
  fi

  NUM4=`expr ${NUM4} + 1`

done
