FROM alpine:edge

ARG VERSION="0.16.12-r0"
ARG UGID=1000

LABEL maintainer="Gianluca Gabrielli" mail="tuxmealux+dockerhub@protonmail.com"
LABEL description="rTorrent on Alpine Linux, with a better Docker integration."
LABEL website="https://github.com/TuxMeaLux/alpine-rtorrent"
LABEL version="$VERSION"

EXPOSE 16891
EXPOSE 6881
EXPOSE 6881/udp
EXPOSE 50000


RUN addgroup --gid $UGID download && \
    adduser -S -u $UGID -G download download
    
RUN apk add --no-cache rtorrent="$VERSION"


USER download

RUN mkdir -p /home/download/rtorrent/config.d/ && \
    mkdir -p /home/download/rtorrent/.session/ && \
    mkdir -p /home/download/rtorrent/download/ && \
    mkdir -p /home/download/rtorrent/watch/
    
COPY --chown=download:download config.d/ /home/download/rtorrent/config.d/
COPY --chown=download:download .rtorrent.rc /home/download/

WORKDIR /home/download/

CMD ["rtorrent"]
