#/bin/bash
isSpotify=$(playerctl -l | grep "spotify")
if [[ $isSpotify == "spotify" ]]; then
    spotifyStatus=$(playerctl -p spotify status)
else
    spotifyStatus=""
fi

if [[ $spotifyStatus == "Playing" ]]; then
    title=$(playerctl -p spotify metadata position --format '{{title}}')
    title_print=${title:0:$1}
    artist=$(playerctl -p spotify metadata position --format '{{trunc(artist,20)}}')
    duration=$(playerctl -p spotify metadata position --format '{{duration(mpris:length)}}')
else
    title=$(playerctl --player=plasma-browser-integration metadata position --format '{{title}}')
    title_print=${title:0:$1}
    artist=$(playerctl --player=plasma-browser-integration metadata position --format '{{trunc(artist,20)}}')
    duration=$(playerctl --player=plasma-browser-integration metadata position --format '{{duration(position)}}|{{duration(mpris:length)}}')
    # print=$(playerctl --player=plasma-browser-integration metadata position --format '{{ trunc(title,30)}}: {{trunc(artist, 20)}} : {{duration(position)}}|{{duration(mpris:length)}}')
fi

echo ${title_print} : ${artist} : ${duration}
