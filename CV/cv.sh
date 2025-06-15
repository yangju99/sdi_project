#!/bin/bash
export TURTLEBOT3_MODEL=waffle
source /home/webeng/.bashrc

# shell 1: Gazebo 시뮬레이터 실행
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py

# shell 2: Navigation2 실행
ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:/home/webeng/map.yaml

# shell 3: 자동 목표 이동 Python 스크립트 실행
python3 /home/webeng/single_goal_nav.py









