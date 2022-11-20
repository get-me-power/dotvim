deploy_path=$HOME/vim
remote_path=https://github.com/vim/vim
branch=master

cd $HOME/vim
git pull origin master
# build
echo 'start build vim OK? [yes/no]'
read answer
if [ "$answer" == "yes" ]; then
    make distclean
    pyenv local --unset
    pyenv shell --unset
    pyenv global 3.7.0
    LDFLAGS="-Wl,-rpath=${HOME}/.pyenv/versions/3.6.3/lib"
    ./configure \
        --prefix=$HOME \
        --with-features=huge \
        --enable-gpm \
        --enable-cscope \
        --enable-multibyte \
        --enable-fontset \
        --enable-perlinterp \
        --enable-pythoninterp=no \
        --enable-python3interp=yes \
        --enable-gui=auto \
        --enable-rubyinterp=yes \
        --enable-luainterp=yes --with-lua-prefix=/usr/local \
        --enable-fail-if-missing
    make
    make install
    echo 'build done!'
    pyenv global 3.8.2
else
    echo 'finish'
fi
