# Drone claw machine

# How to use

1, Set up

Please chech this: https://github.com/hisazumi/gnc


2, Clone the following repositories.

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


3, Rename the repositories as follow.

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


4, Build packages on terminal.

If you have some error, please continue.

```sh
# e.g.
cd ~/catkin_ws
catkin build
```


5, Build `gnc` package on BridgePoint.

For more information on how to build on BridgePoint, please read this: https://github.com/hisazumi/gnc/blob/master/README.md  
If you have some error, please try the following steps.

1. Run `catkin clean` in `~/catkin_ws`.
2. Run `catkin build` in `~/catkin_ws`.
3. Build `gnc` package on BridgePoint.


6, Let's run!

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
