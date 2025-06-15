#!/bin/bash

# 명시적 GUI 환경 전달
export DISPLAY=:0
export XAUTHORITY=/home/webeng/.Xauthority
export TURTLEBOT3_MODEL=burger
export FORCE_BASHRC=1
source /home/webeng/.bashrc

# shell 1: Gazebo
gnome-terminal -- bash -c "source /home/webeng/.bashrc; export TURTLEBOT3_MODEL=burger; ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py; exec bash"
sleep 5

# shell 2: Navigation2
gnome-terminal -- bash -c "source /home/webeng/.bashrc; export TURTLEBOT3_MODEL=burger; ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:/home/webeng/map.yaml; exec bash"
sleep 5

# shell 3: 목표 이동
gnome-terminal -- bash -c "source /home/webeng/.bashrc; export TURTLEBOT3_MODEL=burger; python3 /home/webeng/single_goal_nav.py; exec bash"



