#!/bin/bash

export FORCE_BASHRC=1
source /home/webeng/.bashrc
export TURTLEBOT3_MODEL=waffle

ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py

ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:/home/webeng/map.yaml

python3 /home/webeng/single_goal_nav.py









