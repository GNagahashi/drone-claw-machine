# Drone claw machine

These are the products of the enPiT summer school in 2022.

# How to use

**1, Set up**

1. Please chech this: https://github.com/hisazumi/gnc
2. Set up github.
3. Clone this repository. (check the below)
4. Set up gazebo models. (check the below)

```sh
cd
git clone https://github.com/GNagahashi/drone-claw-machine.git

sudo apt install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update

cd ~/drone_claw_machine/model_drone
sudo cp /usr/share/gazebo-9/models/iris_with_standoffs/model.sdf ./model.sdf.bak
sudo cp model.sdf /usr/share/gazebo-9/models/iris_with_standoffs/

cd ~/.gazebo
rm -rf models
git clone https://github.com/osrf/gazebo_models.git
export GAZEBO_MODEL_DATABASE_URI=""

rm -rf ~/.gazebo/iris_with_standoffs

cd ~/drone_claw_machine/model_gzobject
cp -r * ~/.gazebo/models

# Probably below packages are already installed.
# Check: apt list | grep ros-melodic-gazebo- && apt list | grep ros-melodic-image-view
# If you didn't install these packages, please run the following commands.

sudo apt install ros-melodic-gazebo-ros-pkgs ros-melodic-gazebo-ros-control
sudo apt install ros-melodic-image-view

# If you want to check correctly set up, pleaes run the following commands.
export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:/opt/ros/melodic/lib/
echo $GAZEBO_PLUGIN_PATH

source /home/ubuntu/catkin_ws/devel/setup.bash

rosrun gazebo_ros gazebo --verbose worlds/iris_arducopter_runway.world
```


**2, Clone the following repositories to `catkin_ws/src`.**

- https://github.com/GNagahashi/enpit2022-summer
- https://github.com/GNagahashi/enpit2022-summer-drone-ctrl
- https://github.com/GNagahashi/enpit2022-summer-drone-position

```sh
cd ~/catkin_ws/src
git clone https://github.com/GNagahashi/enpit2022-summer.git
git clone https://github.com/GNagahashi/enpit2022-summer-drone-ctrl.git
git clone https://github.com/GNagahashi/enpit2022-summer-drone-position.git
```


**3, Rename the repositories as follow.**

- `enpit2022_summer` -> `gnc`
- `enpit2022_summer_drone_ctrl` -> `drone_ctrl`
- `enpit2022_summer_drone_position` -> `drone_position`

```sh
# e.g.
cd ~/catkin_ws/src
mv enpit2022_summer/ gnc
mv enpit2022_summer_drone_ctrl/ drone_ctrl
mv enpit2022_summer_drone_position/ drone_position

```


**4, Build packages on terminal.**

If you have some error, please continue.

```sh
# e.g.
cd ~/catkin_ws
catkin build
```


**5, Build `gnc` package on BridgePoint.**

For more information on how to build on BridgePoint, please read this: https://github.com/hisazumi/gnc/blob/master/README.md  
If you have some error, please try the following steps.

1. Run `catkin clean` in `~/catkin_ws`.
2. Run `catkin build` in `~/catkin_ws`.
3. Build `gnc` package on BridgePoint.


**6, Let's run!**

Please try the following commands.

```sh
roscore

cd ~/drone_claw_machine
./simulator.sh

cd ~/Desktop
./sitl.sh

roslaunch iq_sim apm.launch
# Please wait a minute, check sitl console

rosrun gnc ctrl

roslaunch drone_ctrl drone_ctrls.launch
```

If you could not execute `roslaunch drone_ctrl drone_ctrls.launch`, pelase try the following commands.

```sh
rosrun drone_position drone_position.py

rosrun image_view image_view image:=/camera1/image_raw

rosrun drone_ctrl drone_ctrl_gui.py
```
