# rpi-mpd

This Image is based on [vitiman/alpine-mpd](https://github.com/vitiman/alpine-mpd).

This is a minimal mpd Image for a docker Music Server Application for the Raspberry pi

# How to use 


You can create volumes for your music, playlists and/or database, or use host volumes instead, you need to replace `your_SOMETHING_volume` with your host path or own volume.

    docker run -d -p 6600:6600 \ 
        -v your_music_volume:/var/lib/mpd/music \
        -v your_playlists_volume:/var/lib/mpd/playlists \
        -v your_database_volume:/var/lib/mpd/database \
        --name mpd bse666/rpi-mpd:latest


An instance of mpd is now running with the port 6600 mapped to your host or docker-machine IP address.

# Custom configuration 

Check the repository and you will find an `mpd.conf` you can edit and set your custom configuration. You just need to build the image again.

The passwords in the current configuration are just for testing purposes.

# Docker-music-stack

Based on VitiMan's Music Stack i built a [this](https://github.com/bse666/rpi-music-stack).
It consists of:

- [mpd](http://mpd.wikia.com/wiki/Music_Player_Daemon_Wiki) My favorite music server application
- [icecast](http://icecast.org/): To stream the audio over the world
- [sima](http://kaliko.me/code/mpd-sima/): Autoqueue client. Never stop listen!
- [ympd](https://www.ympd.org/): A minimal Web GUI.

Enjoy!
