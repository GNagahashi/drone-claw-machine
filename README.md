# Drone claw machine

These are the products of the enPiT summer school in 2022.

# How to use

**1, Set up**

1. Please chech this: https://github.com/hisazumi/gnc
2. Install `image_view` package. Please try the following commands.

```sh
# cp /usr/share/gazebo-9/models/iris_with_standoffs/model.sdf ./model.sdf.bak
# cp model.sdf /usr/share/gazebo-9/models/iris_with_standoffs/
# rm -r ~/.gazebo/iris_with_standoffs

sudo apt install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update

sudo apt install ros-melodic-gazebo-ros-pkgs ros-melodic-gazebo-ros-control
sudo apt install ros-melodic-image-view
```


**2, Clone the following repositories.**

- https://github.com/GNagahashi/drone_claw_machine
- https://github.com/GNagahashi/enpit2022_summer
- https://github.com/GNagahashi/enpit2022_summer_drone_ctrl
- https://github.com/GNagahashi/enpit2022_summer_drone_position

```sh
# e.g.
cd
git clone https://github.com/GNagahashi/drone_claw_machine.git

cd ~/catkin_ws/src
git clone https://github.com/GNagahashi/enpit2022_summer.git
git clone https://github.com/GNagahashi/enpit2022_summer_drone_ctrl.git
git clone https://github.com/GNagahashi/enpit2022_summer_drone_position.git
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

cd Desktop
./sitl.sh

roslaunch iq_sim apm.launch
# please wait a minute, check sitl console

rosrun gnc ctrl

roslaunch drone_ctrl drone_ctrls.launch
```

If you could not execute `roslaunch drone_ctrl drone_ctrls.launch`, pelase try the following commands.

```sh
rosrun drone_position drone_position.py

rosrun image_view image_view image:=/camera1/image_raw

rosrun drone_ctrl drone_ctrl_gui.py
```
