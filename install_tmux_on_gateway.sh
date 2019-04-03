#!/bin/sh

# See http://wiki.nhnent.com/pages/viewpage.action?pageId=265229488

# Prerequisite
# All works are done in temporary directory
mkdir tmux-tmp
cd tmux-tmp/

# select target directory
read -p "select a target directory: [Default $HOME/.usr]" TARGET
if [ -z "$TARGET" ]
then
TARGET=$HOME/.usr
fi

LIB=$TARGET/lib

# install libevent
wget https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz
tar xfz libevent-2.0.22-stable.tar.gz
cd libevent-2.0.22-stable
./configure --prefix=$LIB/libevent
make
make install
cd ..

# install ncurse library
wget http://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz
tar xfz ncurses-6.0.tar.gz
cd ncurses-6.0
./configure --prefix=$LIB/ncurse/ --with-default-terminfo-dir=$TARGET/share/terminfo
make
make install
cd ..

# install tmux
wget https://github.com/tmux/tmux/releases/download/2.1/tmux-2.1.tar.gz
tar xfz tmux-2.1.tar.gz
cd tmux-2.1
./configure --prefix=$TARGET/tmux \
CFLAGS="-I$LIB/ncurse/include/ncurses" \
LDFLAGS="-L$LIB/ncurse/lib" \
LIBEVENT_CFLAGS="-I $LIB/libevent/include" \
LIBEVENT_LIBS="-L $LIB/libevent/lib -levent"
make
make install
cd ..

# configure tmux
cd $HOME
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:'"$LIB/libevent/lib" >> .bashrc
echo 'export PATH=$PATH:'"$TARGET/tmux/bin" >> .bashrc

echo "set path=(\$path /home1/`eval "whoami"`/.bin/tmux/bin)" >> .cshrc
