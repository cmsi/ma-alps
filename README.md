# ALPS

## How to build alps packages

1. ソースファイルの準備 (ホスト上で)

        cd $HOME/vagrant/data/src
        sh $HOME/vagrant/development/ma-alps/make_snapshot.sh REVISION DATE

2. (初回のみ)必要なライブラリのインストール (仮想マシン上で)

        sh /development/ma-alps/setup.sh

3. パッケージのビルド

        cd $HOME/build
        sh /development/ma-alps/build.sh > build.log 2>&1 &

4. 生成物を移動

        VERSION=20150825~r7620-1
        mkdir -p /data/alps_${VERSION}
        mv alps-applications_${VERSION}_*.deb alps-tutorials_${VERSION}_*.deb libalps_${VERSION}_*.deb libalps-bin_${VERSION}_*.deb libalps-dbg_${VERSION}_*.deb libalps-dev_${VERSION}_*.deb libboost-numeric-bindings-dev_${VERSION}_*.deb python-pyalps_${VERSION}_*.deb task-alps_${VERSION}_*.deb /data/alps_${VERSION}
