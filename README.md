# ALPS

## How to build alps packages

1. ソースファイルの準備 (ホスト上で)

        cd $HOME/vagrant/data/src
        sh $HOME/vagrant/development/ma-alps/make_snapshot.sh [REVISION]

2. パッケージのビルド

        sh $HOME/vagrant/development/ma-alps/host-build.sh

3. パッケージへの署名

        sh $HOME/vagrant/development/MateriAppsLive/repos/host-sign.sh alps

4. リポジトリへの登録

        sh $HOME/vagrant/development/MateriAppsLive/repos/host-add.sh alps
