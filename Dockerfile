FROM ros:noetic-ros-core

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV ROS_DISTRO=noetic

# Installiere xacro und seine Basisabhängigkeiten
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-xacro \
    python3-roslaunch \
    build-essential \
    cmake \
    python3-catkin-tools \
    && rm -rf /var/lib/apt/lists/*

# ROS automatisch sourcen
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash && source /root/ros_ws/devel/setup.bash" >> /root/.bashrc

WORKDIR /root/ros_ws

CMD ["bash"]
