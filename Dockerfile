FROM alpine:edge

ARG VERSION="0.15.1-r0"
ARG UGID=666

LABEL maintainer="Gianluca Gabrielli" mail="tuxmealux+dockerhub@protonmail.com"
LABEL description="rTorrent on Alpine Linux, with a better Docker integration."
LABEL website="https://github.com/TuxMeaLux/alpine-rtorrent"
LABEL version="$VERSION"

RUN addgroup -g $UGID rtorrent && \
    adduser -S -u $UGID -G rtorrent rtorrent && \
    apk add --no-cache rtorrent="$VERSION" && \
    mkdir -p /home/rtorrent/.rtorrent/config.d && \
    mkdir -p /home/rtorrent/rtorrent/config.d && \
    mkdir /home/rtorrent/rtorrent/.session && \
    mkdir /home/rtorrent/rtorrent/download && \
    mkdir /home/rtorrent/rtorrent/watch && \
    chown -R rtorrent:rtorrent /home/rtorrent/rtorrent/ && \
    chown -R rtorrent:rtorrent /home/rtorrent/.rtorrent/

COPY --chown=rtorrent:rtorrent config.d/ /home/rtorrent/.rtorrent/config.d/
COPY --chown=rtorrent:rtorrent .rtorrent.rc /home/rtorrent/
COPY --chown=rtorrent:rtorrent entrypoint.sh /home/rtorrent/entrypoint.sh

VOLUME /home/rtorrent/rtorrent/.session

RUN chmod +x /home/rtorrent/entrypoint.sh

EXPOSE 16891
EXPOSE 6881
EXPOSE 6881/udp
EXPOSE 50000

USER rtorrent

CMD ["/home/rtorrent/entrypoint.sh"]
