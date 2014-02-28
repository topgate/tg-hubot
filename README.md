# TG社のHubotちゃん

現在、hubotちゃんの脳みそはローカルファイルとして保存されています。
これは"file-brain.coffee"を使っていることによるものです。
Redisではありません(Redisにすると引っ越しがめんどくさそうだったので)
brain-dump.jsonを持っていけば一瞬で移行が完了します。

## ローカルで実行してみる

`./runhubot.sh` する

## Docker上で実行してみる

`docker build .` する

### その前に

`brew install boot2docker` して `boot2docker init` して `boot2docker up` する

## boot2docker に接続する

`boot2docker ssh` してパスワードは `tcuser`

## GCE に接続する

`gcutil ssh no1`

接続後、vvakameユーザのルートにtg-hubotフォルダがある(変更したい…)

### その前に

`gcloud auth login` とかしてその後project idに`topgate-hubot`を指定しておく

## dockerのゲスト側に接続する

`docker ps -a` とかして適切なイメージIDを見つける たいてい一番上？
イメージIDにタグつければいいんだろうけどdocker repositoryに行ってしまっても困るしな感

`docker run -d -p 22 イメージID` するとPORTSのとこにフォワーディング先が見える
`ssh root@localhost -p フォワーディング先ポート` でゲストに接続できる PW:admin (Dockerfile内で定義)

# 今解決したいこと Contribute please!

* GCE上で動かす方法変えたい
  * 今、わかめマシンからログインした先が作業場所になっているので他の人がいじれない…
* お引っ越し手順をまとめておきたい
  * Dockerの運用中イメージをcommitしてまるごと移築する方法
  * 最悪brain-dump.jsonだけ移動する手順をまとめればいいかな
* @hubot die とかした時に自動的に復帰するようにしたい
  * 要するに死活監視
  * その時に `git pull --rebase` してから復帰してほしい

# Customizing

## Scripting

Take a look at the scripts in the `./scripts` folder for examples.
Delete any scripts you think are useless or boring.  Add whatever functionality you
want hubot to have. Read up on what you can do with hubot in the [Scripting Guide](https://github.com/github/hubot/blob/master/docs/scripting.md).

## hubot-scripts

There will inevitably be functionality that everyone will want. Instead
of adding it to hubot itself, you can submit pull requests to
[hubot-scripts][hubot-scripts].

To enable scripts from the hubot-scripts package, add the script name with
extension as a double quoted string to the `hubot-scripts.json` file in this
repo.

[hubot-scripts]: https://github.com/github/hubot-scripts

## external-scripts

Tired of waiting for your script to be merged into `hubot-scripts`? Want to
maintain the repository and package yourself? Then this added functionality
maybe for you!

Hubot is now able to load scripts from third-party `npm` packages! To enable
this functionality you can follow the following steps.

1. Add the packages as dependencies into your `package.json`
2. `npm install` to make sure those packages are installed

To enable third-party scripts that you've added you will need to add the package
name as a double quoted string to the `external-scripts.json` file in this repo.
