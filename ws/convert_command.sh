#!/bin/bash
# =====================================================
# Convert Spot XACRO to URDF
# =====================================================

rosrun xacro xacro /root/ros_ws/src/spot_ros/spot_description/urdf/spot.urdf.xacro \
  -o /root/ros_ws/src/spot_ros/spot_description/urdf/spot_converted.urdf