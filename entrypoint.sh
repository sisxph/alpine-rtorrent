#!/bin/bash

export TERM=xterm

if [ -z "$(ls -A /home/rtorrent/rtorrent/config.d/)" ]; then
    cp -r /home/rtorrent/.rtorrent/config.d/* /home/rtorrent/rtorrent/config.d/
fi 

chown -R rtorrent:rtorrent /home/rtorrent/rtorrent/
#rtorrent
/bin/bash
