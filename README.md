# ALPS

## How to build alps packages

1. ソースファイルの準備 (ホスト上で)

        cd $HOME/vagrant/data/src
        sh $HOME/vagrant/development/ma-alps/make_snapshot.sh REVISION DATE

2. パッケージのビルド

        cd $HOME/build
        sh /development/ma-alps/build.sh > build.log 2>&1 &

3. 生成物を移動

        VERSION=20150825~r7620
        mkdir -p /data/alps_${VERSION}
        mv alps_${VERSION}.orig.tar.gz alps_${VERSION}-*.debian.tar.gz *.deb /data/alps_${VERSION}
