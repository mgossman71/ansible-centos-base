docker run \
-e SABNZBD_BASEURL=http://kvip:8080/sabnzbd \
-e SABNZBD_APIKEY=a22e40521969d0572df63388dbeb24f3 \
-p 9387:9387 \
-d \
--restart=always \
msroest/sabnzbd_exporter