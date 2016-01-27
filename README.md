# rss2m3u
Bash script for Linux to convert podcast rss feeds to m3u playlist files. Ideal in combination with Pi Musicbox, Volumio or other MPD clients.

##Dependencies:
xsltproc

##Installation on Debian/Ubuntu:
- apt-get install xsltproc
- nano rss2m3u.sh
- paste code in file
- nano m3u.xls
- paste code in file
- change destination folder in code and save
- chmod +x rss2m3u.sh
- nano rssfeeds.txt
- paste rss feeds, 1 per line, like 
- OVT;http://radiobox2.omroep.nl/rss/ug/programme/28.rss
  
##Usage:
  ./rss2m3u.sh

