FROM hypriot/rpi-alpine-scratch

RUN apk --update add bash wget tar make build-base

RUN mkdir /noip

WORKDIR /noip

RUN wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz

RUN tar vzxf noip-duc-linux.tar.gz --strip-components 1

RUN make

COPY /start.sh /noip/start.sh

CMD ["/bin/bash", "/noip/start.sh"]
