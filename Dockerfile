FROM ubuntu
MAINTAINER vvakame

# setup
RUN apt-get update
# tools
RUN apt-get install -y git curl
# redis
RUN apt-get install -y redis-server
# node.js
ENV PATH $HOME.nodebrew/current/bin:$PATH
RUN curl -L git.io/nodebrew | perl - setup && echo "export PATH=$HOME.nodebrew/current/bin:$PATH" >> .bashrc
RUN nodebrew install-binary v0.10.26 && nodebrew use v0.10.26

# github private repo setup
# RUN ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa
RUN mkdir -p /root/.ssh
ADD https://dl.dropboxusercontent.com/u/6581286/secret/topgate/id_rsa_hubot /root/.ssh/id_rsa
RUN chmod 700 /root/.ssh/id_rsa
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

# hubot setup
RUN npm install -g coffee-script
RUN git clone git@github.com:topgate/tg-hubot.git hubot
RUN cd hubot
RUN git checkout -b tg-custom origin/tg-custom
RUN npm install
RUN ./runhubot.sh
