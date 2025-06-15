#!/bin/bash

# GUI 환경 전달
export DISPLAY=:0
export XAUTHORITY=/home/webeng/.Xauthority
export TURTLEBOT3_MODEL=waffle
export FORCE_BASHRC=1
source /home/webeng/.bashrc

# Gazebo
gnome-terminal -- bash -c "ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py; exec bash"
sleep 5

# Navigation2
gnome-terminal -- bash -c "ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:/home/webeng/map.yaml; exec bash"
sleep 5

# 목표 이동 스크립트
gnome-terminal -- bash -c "python3 /home/webeng/single_goal_nav.py; exec bash"



