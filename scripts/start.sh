#!/bin/bash

ROOT_PATH="/home/ubuntu/todaypopup"
JAR="$ROOT_PATH/application.jar"
PROFILE=dev

APP_LOG="$ROOT_PATH/application.log"
ERROR_LOG="$ROOT_PATH/error.log"
START_LOG="$ROOT_PATH/start.log"

NOW=$(date +%c)

echo "[$NOW] $JAR 복사" >> $START_LOG
cp $ROOT_PATH/build/libs/todaypopup-0.0.1.jar $JAR

echo "[$NOW] > $JAR 실행" >> $START_LOG
nohup java -jar -Dspring.profiles.active=$PROFILE $JAR > $APP_LOG 2> $ERROR_LOG &

sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080

SERVICE_PID=$(pgrep -f $JAR)
echo "[$NOW] > 서비스 PID: $SERVICE_PID" >> $START_LOG
