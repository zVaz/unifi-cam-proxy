FROM python:3.8-alpine
WORKDIR /app

RUN apk update

RUN apk add --update gcc libc-dev linux-headers libusb-dev
RUN apk add --update ffmpeg netcat-openbsd git


COPY . .
RUN pip install .

COPY ./docker/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["unifi-cam-proxy"]
