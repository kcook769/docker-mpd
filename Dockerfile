# Music player daemon
#
#

FROM debian:sid
MAINTAINER Kevin Cook <kevin.t.cook@gmail.com>

RUN apt-get update && apt-get install -y \
	mpc \
	mpd \
	nfs-common \
	sudo \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

run mkdir -p /var/lib/mpd/playlists \
	&& mkdir -p /var/lib/mpd/music \
	&& touch /var/lib/mpd/state \
	&& touch /var/lib/mpd/tag_cache

COPY playlists/* /var/lib/mpd/playlists/
run chmod 0777 -R /var/lib/mpd \
	&& chown -R mpd /var/lib/mpd

ENV HOME /home/mpd
COPY mpd.conf /etc/mpd.conf
COPY mpd.sh /usr/local/bin/mpd.sh
RUN chmod +x /usr/local/bin/mpd.sh
WORKDIR $HOME
USER mpd

ENTRYPOINT [ "/usr/local/bin/mpd.sh" ]
