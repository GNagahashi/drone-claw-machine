# enpit サマースクール 2022
前提条件
- vmwareのインストールが完了している
- 仮想環境のダウンロードが完了している
- ダウンロードした仮想環境をvmwareで開けている(いつでも操作できる状態)


## 1. セットアップ
以下のコマンドを実行してください。
```sh
wget https://raw.githubusercontent.com/GNagahashi/drone-claw-machine/main/install.sh -O- | sh
```


## 2. 実行
以下の順にコマンドを実行してください

まずroscoreを立ち上げます
```sh
roscore
```

新しいターミナルのタブを開き、gazeboを立ち上げます
```sh
cd ~/drone_claw_machine && ./simulator.sh
```

新しいターミナルのタブを開き、sitlを立ち上げます
```sh
cd ~/Desktop && ./sitl.sh
```

新しいターミナルのタブを開き、iq_simを実行します
(iq_sim: ドローンの制御に利用されるプログラム)
```sh
roslaunch iq_sim apm.launch
```

新しいターミナルのタブを開き、gncを実行します
(gnc: ドローンの制御プログラム, bridge pointで作成したもの)
```sh
rosrun gnc ctrl
```

新しいターミナルのタブを開き、以下のコマンドを実行します
(その他必要なプログラムをlaunchファイルで一括起動します)
```sh
roslaunch drone_ctrl drone_ctrls.launch
```

問題なく全てのプログラムが立ち上がった場合、
- ドローンを操作するアプリ
- ドローンに搭載されたカメラ
- gazeboの画面
を見やすい位置に移動させた上で、ドローンを操作してください

必要に応じで、sitlのコンソールなどを確認してください