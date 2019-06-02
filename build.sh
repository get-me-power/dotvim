cd ~/vim/src
./configure --with-features=huge --enable-gui=gtk2 --enable-perlinterp --enable-pythoninterp --enable-python3interp --enable-rubyinterp --enable-luainterp --enable-fail-if-missing
make
sudo make install
