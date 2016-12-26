#!/bin/bash
#output folder /var/lib/mopidy/playlists or /var/lib/mpd/playlists or /var/lib/mpd/music/WEBRADIO or /data/playlist
PLFOLDER="/var/lib/mpd/playlists"
PLFOLDER2="/var/lib/mpd/music/WEBRADIO"
PLFOLDER3="/data/playlist"

#output type (pls, m3u of Volumio 2)
PLTYPE="m3u"
PLTYPE2="pls"
PLTYPE3="volumio"

cd /home/volumio/podcast2playlist/

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
        xsltproc -o "$PLFOLDER3"/"$filename" "$PLTYPE3".xsl "$f"
	sed -i '$ s/.$//' "$PLFOLDER3"/"$filename"
	echo "]" >> "$PLFOLDER3"/"$filename"
done 
