FROM alpine

ENV MPD_VERSION 0.19.12-r0
ENV MPC_VERSION 0.27-r0

# travis does not like this
# https://docs.docker.com/engine/reference/builder/#arg
#ARG user=mpd
#ARG group=audio

RUN apk -q update \
    && apk -q --no-progress add mpd \
    && apk -q --no-progress add mpc \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /var/lib/mpd/music \
    && mkdir -p /var/lib/mpd/playlists \
    && mkdir -p /var/lib/mpd/database \
    && mkdir -p /var/log/mpd/mpd.log
    #&& chown -R mpd:mpd /var/lib/mpd \
    #&& chown -R mpd:mpd /var/log/mpd/mpd.log

# Declare a music , playlists and database volume (state, tag_cache and sticker.sql)
VOLUME ["/var/lib/mpd/music", "/var/lib/mpd/playlists", "/var/lib/mpd/database"]
COPY mpd.conf /etc/mpd.conf

# Entry point for mpc update and stuff
EXPOSE 6600

CMD ["mpd", "--stdout", "--no-daemon"]
