#!/bin/sh

export TERM=xterm

if [ -z "$(ls -A /home/download/rtorrent/config.d/)" ]; then
    cp -r /home/download/.rtorrent/config.d/* /home/download/rtorrent/config.d/
fi 

chown -R download:download /home/download/rtorrent/
#rtorrent
/bin/sh
