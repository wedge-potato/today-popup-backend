#!/bin/bash

ROOT_PATH="/home/ubuntu/todaypopup"
JAR="$ROOT_PATH/application.jar"
STOP_LOG="$ROOT_PATH/stop.log"
SERVICE_PID=$(pgrep -f $JAR) # 실행중인 Spring 서버의 PID

sudo iptables -D PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080

if [ -z "$SERVICE_PID" ]; then
  echo "서비스 NouFound" >> $STOP_LOG
else
  echo "서비스 종료 " >> $STOP_LOG
  kill "$SERVICE_PID"
  # kill -9 $SERVICE_PID # 강제 종료를 하고 싶다면 이 명령어 사용
fi
