#!/bin/bash

hander()
{
    sleep 1
}

trap hander SIGINT

TIME=$(date +%Y-%m-%d-%H-%M-%S)
CLOUD="/cloud/tf"
SAVECLOUD="/cloud/lcl/savecloud"
ODOM="/odom"
IMU="/imu/data"

ZED0="/zed0/left/image_rect_color/compressed /zed0/left/camera_info"
ZED1="/zed1/left/image_rect_color/compressed /zed1/left/camera_info"
ZED2="/zed2/left/image_rect_color/compressed /zed2/left/camera_info"

# ZED0="/zed0/left/image_rect_color/compressed /zed0/left/camera_info /zed0/ds_cloud"
# ZED1="/zed1/left/image_rect_color/compressed /zed1/left/camera_info /zed1/ds_cloud"
# ZED2="/zed2/left/image_rect_color/compressed /zed2/left/camera_info /zed2/ds_cloud"
# COLORED="/sq_lidar/colored"
# TF="/tf /tf_static"

echo $TIME &
echo $CLOUD &
echo $SAVECLOUD &
echo $ODOM &
echo $IMU &
echo $ZED0 &
echo $ZED1 &
echo $ZED2 &
echo $COLORED &
echo $TF &

/opt/ros/kinetic/bin/rosbag record $ODOM $IMU $CLOUD $SAVECLOUD $ZED0 $ZED1 $ZED2 -O /home/amsl/$TIME.bag
