FROM python:3.8-alpine
WORKDIR /app

RUN apk update && apk add --update gcc libc-dev linux-headers libusb-dev && apk add --update ffmpeg netcat-openbsd git cargo zlib-dev libjpeg-turbo-dev

COPY . .

RUN pip install --upgrade pip && pip install .

COPY ./docker/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["unifi-cam-proxy"]
