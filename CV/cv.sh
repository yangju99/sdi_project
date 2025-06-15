#!/bin/bash

# shell 1: Gazebo 시뮬레이터 실행
gnome-terminal -- bash -c "export FORCE_BASHRC=1; source /home/webeng/.bashrc; export TURTLEBOT3_MODEL=waffle; ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py; exec bash"
sleep 5  # Gazebo 로딩 시간 확보

# shell 2: Navigation2 실행
gnome-terminal -- bash -c "export FORCE_BASHRC=1; source /home/webeng/.bashrc; export TURTLEBOT3_MODEL=waffle; ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:/home/webeng/map.yaml; exec bash"
sleep 5  # nav2 bringup 시간 확보

# shell 3: 자동 목표 이동 Python 스크립트 실행
gnome-terminal -- bash -c "export FORCE_BASHRC=1; source /home/webeng/.bashrc; export TURTLEBOT3_MODEL=waffle; python3 /home/webeng/single_goal_nav.py; exec bash"









