# デプロイしたいディレクトリの場所
deploy_path=~/vim

# リモートリポジトリのURL
remote_path=https://github.com/vim/vim

# デプロイするブランチ
branch=master

# デプロイするプロジェクトの名前
#proj_name=proj_name

cd ${deploy_path}

# プロジェクトのディレクトリがあるか確認
# なければclone、あればpullをおこなう
if [ ! -e ${proj_name} ]; then
    git clone ${remote_path} ${proj_name}
    echo 'cloning success!'
else
    # pullもしくはfetch＆reset --hardを使う
    # 競合を起こさないよう、強制的に最新のリモートリポジトリに合わせる
    result=`sudo git pull origin ${branch}`
    if [ "`echo $result | grep 'Already'`" ]; then
        echo 'Already up to date'
        echo 'finish'
    else
        echo 'git pull is success!'
        # build
        cd ~/vim/src
        echo 'start build vim OK? [yes/no]'
        read answer
        if [ "$answer" == "yes" ]; then
            pyenv local --unset
            pyenv shell --unset
            pyenv global 2.7.6 3.7.0
            sudo make distclean
            ./configure \
                --with-features=huge \
                --enable-perlinterp \
                --enable-pythoninterp \
                --enable-python3interp \
                --enable-rubyinterp=yes \
                --enable-luainterp \
                --enable-fail-if-missing
                sudo make
                sudo make install
                echo 'build done!'
                pyenv global anaconda3-5.3.1
            else
            	echo 'finish'
            fi
        fi
    fi
