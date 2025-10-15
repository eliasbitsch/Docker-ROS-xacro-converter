# Docker-ROS-xacro-converter

https://github.com/user-attachments/assets/4ced1b28-7972-4a19-918d-d893e7375980

Small helper container and instructions to convert ROS xacro files to URDF without a full ROS desktop install.

## Prerequisites
- Linux (native) 🐧 or WSL2 on Windows 🪟
- Docker installed and working 🐳

If using WSL2, ensure Docker Desktop is configured to integrate with WSL2 and the distro you use.

Clone this repository:
```bash
git clone https://github.com/eliasbitsch/Docker-ROS-xacro-converter.git    
```

## Quick usage

1. Run the container run.sh script, mounting your ROS workspace:
```bash
  ./run.sh
  ```

## Convert a xacro to URDF

Inside the container (after sourcing ROS and workspace), run one of the following:

2. Build the workspace using catkin_make:
```bash
catkin_make
```

3. Source the workspace and ROS:
  ```bash
  source /opt/ros/noetic/setup.bash
  ```
  ```bash
  source /root/ros_ws/devel/setup.bash
  ```
  Now you can convert the xacro using rosrun:
  ```bash
  rosrun xacro xacro /root/ros_ws/src/spot_ros/spot_description/urdf/spot.urdf.xacro \
    -o /root/ros_ws/src/spot_ros/spot_description/urdf/spot_converted.urdf
  ```

  or run the convert_command.sh script:
  ```bash
  ./convert_command.sh
  ```

You should find the converted URDF without the "xacro" ending. Now you are now ready to use the converted URDF file in your ROS projects! 🥳