#!/bin/bash


mkdir -p /var/lib/mpd/{playlists} \
	&& touch /var/lib/mpd/{state,tag_cache} \
	&& chown -R mpd /var/lib/mpd/playlists /var/lib/mpd/state /var/lib/mpd/tag_cache

exec mpd --no-daemon --stdout --verbose /etc/mpd.conf "$@"
