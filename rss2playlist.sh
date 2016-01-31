#!/bin/bash
#output folder /var/lib/mopidy/playlists or /var/lib/mpd/playlists or /var/lib/mpd/music/WEBRADIO
PLFOLDER="/var/lib/mpd/playlists"
PLFOLDER2="/var/lib/mpd/music/WEBRADIO"
#output type (pls or m3u)
PLTYPE="m3u"
PLTYPE2="pls"

cd /root/rss2pls/

#download rss feeds
while read p; do
  echo "${p%;*}"
  echo "${p##*;}"
  wget "${p##*;}" -O "${p%;*}".rss      
done <rssfeeds.txt

#convert rss feeds to playlist
shopt -s nullglob
for f in *.rss
do
        filename=$(basename "$f")
        #extension="${filename##*.}"
        filename="${filename%.*}"
        echo "Converting rss file - $f"
        xsltproc -o "$PLFOLDER"/"$filename"."$PLTYPE" "$PLTYPE".xsl "$f"
        xsltproc -o "$PLFOLDER2"/"$filename"."$PLTYPE2" "$PLTYPE2".xsl "$f"
done 
