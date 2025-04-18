#!/bin/sh

if [ -z "$(ls -A /home/rtorrent/rtorrent/config.d/)" ]; then
    cp -r /home/rtorrent/.rtorrent/config.d/* /home/rtorrent/rtorrent/config.d/
    chown -R rtorrent:rtorrent /home/rtorrent/rtorrent/
fi 

export TERM=xterm
rtorrent
