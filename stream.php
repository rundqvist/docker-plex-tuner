<?php

$provider = $_GET['provider'];
$channel = $_GET['channel'];

$ccmd = 'streamlink -O \
    --stream-segment-attempts 1000 \
    --stream-segment-timeout 60 \
    --hls-segment-attempts 1000 \
    --hls-segment-timeout 60 \
    --retry-open 1000 \
    --retry-streams 60 \
    --player-passthrough http,hls \
    ';

if($provider == "tvplayer")
{
    $pcmd = '--http-proxy "TVPLAYER_PROXY" \
    --https-proxy "TVPLAYER_PROXY" \
    --tvplayer-email "TVPLAYER_EMAIL" \
    --tvplayer-password "TVPLAYER_PASSWORD" \
    https://tvplayer.com/watch/'.$channel.' best';
}
else if($provider=="nrk")
{
    $pcmd = '--http-proxy "NRK_PROXY" \
    --https-proxy "NRK_PROXY" \
    https://tv.nrk.no/direkte/'.$channel.' best';
}
else if($provider=="svt")
{
    $pcmd = 'https://www.svtplay.se/kanaler/'.$channel.' best';
}
else
{
    die(0);
}

header('Content-type: video/mpeg');
header("Content-Type: application/octet-stream");
passthru($ccmd . $pcmd);
?>