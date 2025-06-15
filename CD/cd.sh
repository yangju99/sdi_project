#!/bin/bash

# 터틀봇 라즈베리파이에 접속해서 bringup 실행
# $ ssh ubuntu@{IP_ADDRESS_OF_RASPBERRY_PI}
# $ export TURTLEBOT3_MODEL=${TB3_MODEL}
# $ ros2 launch turtlebot3_bringup robot.launch.py

# remote pc에서 navigation 실행
export TURTLEBOT3_MODEL=burger
ros2 launch turtlebot3_navigation2 navigation2.launch.py map:=$HOME/lab_map.yaml &

# navigation2가 실행될 시간을 확보 (필요시 조정)
sleep 5

# 새로운 쉘에서 자동 목표 이동 Python 스크립트 실행
gnome-terminal -- bash -c "export TURTLEBOT3_MODEL=burger; source ~/.bashrc; python3 \$HOME/single_goal_nav_lab.py; exec bash"