FROM python:3.8-alpine3.10
WORKDIR /app

RUN apk add ffmpeg --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community

RUN apk update

RUN apk add --update gcc libc-dev linux-headers libusb-dev
RUN apk add --update ffmpeg=5.1.2-r3 netcat-openbsd git


COPY . .
RUN pip install .

COPY ./docker/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["unifi-cam-proxy"]
