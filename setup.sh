#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

mkdir -p ~/.config/
ln -sfv $SCRIPT_DIR ~/.config/

# ローカルファイルを作成
mkdir -p ~/.local/share/nvim/backup
mkdir -p ~/.local/share/nvim/undo

# dein をインストール
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm ./installer.sh

