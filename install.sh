cd ~/
git clone https://github.com/GNagahashi/drone-claw-machine.git drone_claw_machine

cd ~/drone_claw_machine/model_drone
sudo cp /usr/share/gazebo-9/models/iris_with_standoffs/model.sdf ./model.sdf.bak
sudo cp model.sdf /usr/share/gazebo-9/models/iris_with_standoffs/

cd ~/drone_claw_machine/model_gzobject
cp -r * ~/.gazebo/models

cd ~/catkin_ws/src
git clone https://github.com/GNagahashi/enpit2022-summer.git gnc
git clone https://github.com/GNagahashi/enpit2022-summer-drone-ctrl.git drone_ctrl
git clone https://github.com/GNagahashi/enpit2022-summer-drone-position.git drone_position

cd ~/catkin_ws
catkin clean -y
catkin init

echo "finished"