FROM hypriot/rpi-alpine-scratch
ARG NOIP_USER
ARG NOIP_PASSWORD

RUN apk --update add bash wget tar make build-base

RUN mkdir /noip

WORKDIR /noip

RUN wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz

RUN tar vzxf noip-duc-linux.tar.gz --strip-components 1

RUN make

RUN sed -i "s/-C -c \/tmp\/no-ip2.conf/-U 1 -d -u "$NOIP_USER" -p \"$(echo $NOIP_PASSWORD | sed -e 's/\\/\\\\/g; s/\//\\\//g; s/&/\\\&/g')\" -C -c \/tmp\/no-ip2.conf/g" Makefile

RUN make install

COPY /start.sh /noip/start.sh

CMD ["/bin/bash", "/noip/start.sh"]
