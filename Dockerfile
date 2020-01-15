FROM node:12.14.1-alpine3.10

ARG TIMEZONE="UTC"
RUN set +x && apk add --no-cache tzdata bash \
    && cp /usr/share/zoneinfo/${TIMEZONE}  /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \
    && date \
    && apk del tzdata

RUN apk --no-cache add --virtual builds-deps autoconf automake build-base libtool nasm python zlib-dev

CMD ["/bin/bash"]
