#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

function GetConfirmation() {
    echo "$1 (y/n)"
    read input
    if [ "$input" = 'y' ] ; then
        return 0
    elif [ "$input" = 'n' ] ; then
        return 1
    else
        GetConfirmation "$1"
    fi
}


mkdir -p ~/.config/
ln -sfv $SCRIPT_DIR ~/.config/

mkdir -p ~/.local/share/nvim/backup
mkdir -p ~/.local/share/nvim/undo

# If necessary, install dein (and pynvim).
if GetConfirmation "Install dein?" ; then
    curl -sSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein
    rm ./installer.sh

    pip3 install --user pynvim
fi

