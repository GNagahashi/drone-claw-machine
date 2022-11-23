# enpit サマースクール 2022
このリポジトリは「enPiT サマースクール 2022」の成果物です  
内容としては「ドローンを用いたクレーンゲーム」になります

## 0. セットアップの前に
前提条件
- vmwareのインストールが完了している
- 仮想環境のダウンロードが完了している
- ダウンロードした仮想環境をvmwareで開けている(いつでも操作できる状態)

まっさらな環境であることが条件です。  
既に他のプロジェクトを作成している場合、致命的なエラーが発生する可能性があります。  
事前にバックアップを作成してください。

## 1. セットアップ
以下のコマンドを実行してください。
```sh
wget https://raw.githubusercontent.com/GNagahashi/drone-claw-machine/main/install.sh -O- | sh
```

次に、bridge pointでgncをビルドしてください(以下、手順)
1. bridge pointの起動(デスクトップ画面にショートカットあり)
1. `select a directory as workspace`というウィンドウが起動、何もせず`Launch`を選択
1. (ウィンドウ左上)`File`を選択
1. `Import...`を選択
1. `General`の`Existing Projects into Workspace`を選択
1. `select root directory`の右横にある`browse...`を選択
1. 左にあるメニューから`Home`を選択、右のファイル,ディレクトリ一覧から`catkin_ws/src/gnc`に移動、ウィンドウ右上にある`OK`を選択
1. ウィンドウ中央の`Projects:`に`gnc(/home/ubuntu/catkin_ws/src/gnc)`があることを確認する
1. ウィンドウ右下にある`Finish`を選択
1. ウィンドウ左上にある`Welcome`を選択する
1. ウィンドウ上部のメニューバーより`Project`→`Build All`を選択
1. ウィンドウ右下の`Console`にログが流れる、`Build Finished`と表示されれば完了

bridge pointでのビルド時、エラーが発生する場合は`~/catkin_ws`上で`catkin clean`と`catkin build`を行う  
ターミナルとbridge pointの両方でビルドが成功すればok  
(この辺の不具合は要調査)

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
このとき、iq_simを実行した画面に
```
[  INFO] [...]: FCU: EKF2 IMU0 is using GPS
[  INFO] [...]: FCU: EKF2 IMU1 is using GPS
```
というようなメッセージが表示されるまで待つ(これをしないとうまくgncが動かない場合がある)  

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