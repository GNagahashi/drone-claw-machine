# Drone claw machine

## How to use

Before set up, please read this: https://github.com/hisazumi/gnc

1, Clone this repository.
```sh
# Go to `src` directory under the your workspace
cd ~/catkin_ws/src
git clone https://github.com/GNagahashi/drone_claw_machine.git
```

2, Rename this repository in the local from `drone_claw_machine` to `gnc`.
```sh
# cd ~/catkin_ws/src
mv drone_claw_machine/ gnc
```

3, Build on BridgePoint.

4, Run in Terminal.
```sh
# Before executing, run `~/Desktop/simulator.sh`, `~/Desktop/sitl.sh`, `roscore`, `rosrun iq_sim apm.launch`
rosrun gnc ctrl
```
