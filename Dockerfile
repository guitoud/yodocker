FROM guitoud/jessieyeomanbuildessential:latest

RUN apt-get --quiet update && apt-get install --quiet --yes couchdb curl git imagemagik language-pack-fr language-pack-en lsof postfix pwgen python-pip sqlite3 wget python-dev

RUN update-locale LANG=en_US.UTF-8

RUN cd /tmp && wget -q -O - http://nodejs.org/dist/v0.10.40/node-v0.10.40.tar.gz | tar xz \
 && cd node-v0.10.40 \
 && ./configure \
 && CXX="g++ -Wno-unused-local-typedefs" make \
 && CXX="g++ -Wno-unused-local-typedefs" make install \
 && cd .. \
 && rm -rf /tmp/node-v* \
 && npm install -g npm@latest-2

RUN npm install -g \
	yeoman
	phantomjs
