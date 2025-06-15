#!/bin/bash
export TURTLEBOT3_MODEL=waffle
source ~/.bashrc

# shell 1: Gazebo 시뮬레이터 실행
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
# 이 명령이 끝날 때까지 다음 줄로 가지 않음
# 일반적으로 Gazebo는 수동으로 닫기 전까지 계속 실행됨

# shell 2: Navigation2 실행 (Gazebo 종료 후 실행됨)
ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:=$HOME/map.yaml

# shell 3: 자동 목표 이동 Python 스크립트 실행 (nav2 종료 후 실행됨)
python3 $HOME/single_goal_nav.py









