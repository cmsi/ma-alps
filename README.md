# ALPS

## How to build alps packages

1. ソースファイルの準備 (ホスト上で)

        cd $HOME/vagrant/data/src
        sh $HOME/vagrant/development/ma-alps/make_snapshot.sh REVISION DATE

2. ビルドディレクトリの準備

        cd $HOME/build
        sh /development/ma-alps/setup.sh

3. パッケージのビルド

        cd $HOME/build
        sh /development/ma-alps/build.sh 2>&1 | tee build.log

4. パッケージへの署名

        cd $HOME/build
        debsign alps_*.changes 

5. リポジトリへの登録

        cd $HOME/build
        sh /development/MateriAppsLive/vagrant/add_repo.sh alps_*.changes
