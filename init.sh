#!/bin/sh

#mkfifo /var/log/test.log
#tail -f /var/log/test.log &

sed -i 's/HOST_IP/'${HOST_IP}'/g' ./iptv/*.m3u
sed -i 's/STREAM_PORT/'${STREAM_PORT}'/g' ./iptv/*.m3u

sed -i 's/NRK_PROXY/'${NRK_PROXY//\//\\/}'/g' /var/www/localhost/htdocs/stream.php
sed -i 's/TVPLAYER_EMAIL/'${TVPLAYER_EMAIL}'/g' /var/www/localhost/htdocs/stream.php
sed -i 's/TVPLAYER_PASSWORD/'${TVPLAYER_PASSWORD//\//\\/}'/g' /var/www/localhost/htdocs/stream.php
sed -i 's/TVPLAYER_PROXY/'${TVPLAYER_PROXY//\//\\/}'/g' /var/www/localhost/htdocs/stream.php

# http://127.0.0.1:8081/index.php?provider=tvplayer&channel=bbcone
# http://127.0.0.1:8081/index.php?provider=nrk&channel=nrk1
# http://127.0.0.1:8081/index.php?provider=svt&channel=svt1

./telly -listen 0.0.0.0:8201 -playlist iptv/svt.m3u -friendlyname "SVT Play" -deviceid 12348201 &
./telly -listen 0.0.0.0:8202 -playlist iptv/nrk.m3u -friendlyname "NRK TV" -deviceid 12348202 &
./telly -listen 0.0.0.0:8203 -playlist iptv/tvplayer.m3u -friendlyname "TVPlayer" -deviceid 12348203 &

exec /usr/sbin/httpd -D FOREGROUND -f /etc/apache2/httpd.conf

# Works with TVPlayer: lon-a06.ipvanish.com

# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/bbc1.m3u8" "BBC One"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/bbc2.m3u8" "BBC Two"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/bbc4.m3u8" "BBC Four"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/itv.m3u8" "ITV"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/itv2.m3u8" "ITV 2"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/itv3.m3u8" "ITV 3"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/itv4.m3u8" "ITV 4"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/itvbe.m3u8" "ITVBe"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/channel4.m3u8" "Channel 4"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/more4.m3u8" "More 4"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/film4.m3u8" "Film 4"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/e4.m3u8" "E4"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/4seven.m3u8" "4seven"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/five.m3u8" "Five"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/5usa.m3u8" "5USA"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/dave.m3u8" "Dave"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/davejavu.m3u8" "Dave Ja Vu"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/gold.m3u8" "Gold"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/challenge.m3u8" "Challenge"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/really.m3u8" "Really"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/drama.m3u8" "Drama"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/quest.m3u8" "Quest"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/questred.m3u8" "Quest red"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/foodnetwork.m3u8" "Food network"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/foodnetworkplus1.m3u8" "Food network +1"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/travelchannel.m3u8" "Travel channel"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/travelchannelplus1.m3u8" "Travel channel +1"
# ./add-channel.sh "easyview" $((PORT++)) "hlsvariant://https://ovh.easyview.eu/hls/home.m3u8" "Home"
