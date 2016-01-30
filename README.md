# rss2playlist
Bash script for Linux to convert podcast rss feeds to m3u or pls playlist files. It allows you to stream episodes of radio shows Pi Musicbox, Volumio or other MPD/Mopidy clients. Tested with Pi Musicbox on a Raspberry Pi with Raspbian Jessie.

##Dependencies:
xsltproc

##Installation on Debian/Ubuntu:
- apt-get install xsltproc
- nano m3u.xls
- paste code in file
- nano pls.xls
- paste code in file
- nano rss2playlist.sh
- paste code in file
- change destination folder in code and save
- chmod +x rss2m3u.sh
- nano rssfeeds.txt
- paste rss feeds, 1 per line, like 
- OVT;http://radiobox2.omroep.nl/rss/ug/programme/28.rss
  
##Usage:
- ./rss2playlist.sh

or something like

- crontab -e
- 0 * * * * /root/rss2playlist.sh
  

