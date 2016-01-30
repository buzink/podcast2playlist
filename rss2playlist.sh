!/bin/bash
#output folder
PLFOLDER="/var/lib/mopidy/playlists"
#output type (pls or m3u)
PLTYPE="m3u"

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
        xsltproc -o "$PLFOLDER"/"$filename"."$PLTYPE" "$PLTYPE".xls "$f"
done 
#chmod 777 "$PLFOLDER"/*."$PLTYPE"
