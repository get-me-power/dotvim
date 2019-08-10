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
    sudo git pull origin ${branch}
    echo 'git pull success!'
fi
# build
cd ~/vim/src
echo 'start build vim'
./configure \
    --with-features=huge \
    --enable-gui=gtk2 \
    --enable-perlinterp \
    --enable-pythoninterp \
    --enable-python3interp \
    --enable-rubyinterp \
    --enable-luainterp \
    --enable-fail-if-missing

sudo make
sudo make install
