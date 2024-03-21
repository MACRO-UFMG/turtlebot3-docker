# ROS2 desktop full base image with additional linux utils
FROM osrf/ros:humble-desktop AS ros2-base
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y \
    git \
    x11vnc \
    wget \
    unzip \
    xvfb \
    icewm \
    tree \
    dos2unix \
    vim \
    net-tools \
    iputils-ping \
    iproute2 \
    iptables \
    tcpdump \
    nano \
    tmux

# turtlebot3 ros2 image for development
FROM ros2-base AS turtlebot3-ros2
RUN apt-get update
RUN apt install -y \
    libboost-program-options-dev \
    libusb-1.0-0-dev
RUN apt-get install -y \
    ros-${ROS_DISTRO}-tf-transformations \
    ros-${ROS_DISTRO}-gazebo-* \
    ros-${ROS_DISTRO}-cartographer \
    ros-${ROS_DISTRO}-cartographer-ros \
    ros-${ROS_DISTRO}-navigation2 \
    ros-${ROS_DISTRO}-nav2-bringup \
    ros-${ROS_DISTRO}-dynamixel-sdk \
    ros-${ROS_DISTRO}-turtlebot3-msgs \
    ros-${ROS_DISTRO}-turtlebot3 \
    python3-pip
RUN pip3 install rowan cflib transforms3d
RUN echo "source /turtlebot3/ros_ws/install/setup.bash" >> /root/.bashrc
RUN echo ". /usr/share/gazebo/setup.sh" >> /root/.bashrc
WORKDIR turtlebot3 
CMD tail -f /dev/null