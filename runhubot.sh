# rm -rf node_modules/
# npm install

# export HUBOT_AUTH_ADMIN=vvakame
export HUBOT_ADAPTER=idobata
export HUBOT_LOG_LEVEL=debug
export HUBOT_NAME=hubot

# develop & guest-room
export HUBOT_IDOBATA_API_TOKEN=2677d876eaee23765481fe3eb82feeb0

export FILE_BRAIN_PATH=`pwd`

npm install

echo "---------------------------------------------------------"
./bin/hubot
