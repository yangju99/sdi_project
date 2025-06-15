#!/bin/bash

# 명시적 사용자 환경 설정
export HOME=/home/webeng                 # 홈 디렉토리 강제 지정
export DISPLAY=:0                        # X 서버 디스플레이 설정
export XAUTHORITY=$HOME/.Xauthority      # X 서버 인증 정보
export TURTLEBOT3_MODEL=burger
export FORCE_BASHRC=1
source $HOME/.bashrc

# shell 1: Gazebo 실행
gnome-terminal -- bash -c "export HOME=/home/webeng; source \$HOME/.bashrc; export TURTLEBOT3_MODEL=burger; ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py; exec bash"
sleep 5

# shell 2: Navigation2 실행
gnome-terminal -- bash -c "export HOME=/home/webeng; source \$HOME/.bashrc; export TURTLEBOT3_MODEL=burger; ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:\$HOME/map.yaml; exec bash"
sleep 5

# shell 3: 목표 이동 실행
gnome-terminal -- bash -c "export HOME=/home/webeng; source \$HOME/.bashrc; export TURTLEBOT3_MODEL=burger; python3 \$HOME/single_goal_nav.py; exec bash"



