#!/bin/bash
#output folder /var/lib/mopidy/playlists or /var/lib/mpd/playlists or /var/lib/mpd/music/WEBRADIO or /data/playlist
PLFOLDER="/var/lib/mpd/playlists"
PLFOLDER2="/data/playlist"
#output type (pls, m3u of Volumio 2)
PLTYPE="m3u"
PLTYPE2="pls"
PLTYPE3="volumio.xsl"

cd /home/volumio/rss2pls/

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
        #xsltproc -o "$PLFOLDER2"/"$filename"."$PLTYPE2" "$PLTYPE2".xsl "$f"
        xsltproc -o "$PLFOLDER2"/"$filename" "$PLTYPE3" "$f"
	sed -i '$ s/.$//' "$PLFOLDER2"/"$filename"
	echo "]" >> "$PLFOLDER2"/"$filename"
done 
