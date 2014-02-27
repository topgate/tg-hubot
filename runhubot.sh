# rm -rf node_modules/
# npm install

export HUBOT_AUTH_ADMIN=vvakame
export HUBOT_ADAPTER=idobata
export HUBOT_LOG_LEVEL=debug
export HUBOT_NAME=hubot

# develop & guest-room
export HUBOT_IDOBATA_API_TOKEN=2677d876eaee23765481fe3eb82feeb0

export FILE_BRAIN_PATH=`pwd`

export HUBOT_REDMINE_SSL=TRUE
export HUBOT_REDMINE_BASE_URL=https://topgate.redmine.ne.jp/redmine
export HUBOT_REDMINE_TOKEN=dd0f83c88f113d4b67a7ea46a3908320adb39895
# export HUBOT_REDMINE_IGNORED_USERS=

npm install

echo "---------------------------------------------------------"
./bin/hubot
