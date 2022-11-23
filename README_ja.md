# enpit サマースクール 2022
前提条件
- vmwareのインストールが完了している
- 仮想環境のダウンロードが完了している
- ダウンロードした仮想環境をvmwareで開けている(いつでも操作できる状態)

## 1. セットアップ
はじめに、このリポジトリをcloneしてください(重いファイルがあるので、少し時間が掛かります)
```sh
git clone https://github.com/GNagahashi/drone-claw-machine.git drone_claw_machine
```

次に、cloneしてきたリポジトリ内にあるセットアップ用のシェルスクリプトを順に実行していきます
```sh
cd ~/drone_claw_machine
sh setup_01.sh
sh setup_02.sh
```
シェルスクリプトが正しく実行されない場合、シェルスクリプトに書かれたコマンドを1行ずつ手動で行ってください