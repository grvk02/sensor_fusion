#!/bin/bash

hander()
{
    sleep 1
}

trap hander SIGINT

TIME=$(date +%Y-%m-%d-%H-%M-%S)
CLOUD="/cloud/tf"
CLOUD_GLOBAL="/cloud/global"
ODOM="/odom"
IMU="/imu/data"
ZED0="/zed0/left/image_rect_color/compressed /zed0/left/camera_info /zed0/move"
ZED1="/zed1/left/image_rect_color/compressed /zed1/left/camera_info /zed1/move"
ZED2="/zed2/left/image_rect_color/compressed /zed2/left/camera_info /zed2/move"
FLOW="/zed0/optical_flow/compressed /zed1/optical_flow/compressed /zed2/optical_flow/compressed"
DIFF_IMAGE="/zed0/diff_image/compressed /zed1/diff_image/compressed /zed2/diff_image/compressed"
NODE="/node"
TRANSFORM="/transform"
TF="/tf /tf_static"


echo $TIME &
echo $CLOUD &
echo $CLOUD_GLOBAL &
echo $ODOM &
echo $IMU &
echo $ZED0 &
echo $ZED1 &
echo $ZED2 &
echo $FLOW &
echo $NODE &
echo $TRANSFORM &
echo $TF &

/opt/ros/kinetic/bin/rosbag record $CLOUD $CLOUD_GLOBAL $ODOM $IMU $ZED0 $ZED1 $ZED2 $FLOW $NODE $TRANSFORM -O /home/amsl/$TIME.bag