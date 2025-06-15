#!/bin/bash
export TURTLEBOT3_MODEL=waffle
source ~/.bashrc

# shell 1: Gazebo 시뮬레이터 실행
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py &
PID1=$!
sleep 5  # Gazebo가 충분히 로딩될 시간

# shell 2: Navigation2 실행
ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:=$HOME/map.yaml &
PID2=$!
sleep 5  # nav2 bringup 시간 확보

# shell 3: 자동 목표 이동 Python 스크립트 실행
python3 $HOME/single_goal_nav.py &
PID3=$!









