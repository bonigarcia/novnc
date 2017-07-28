FROM psharkey/novnc

COPY vnc-autofocus.html /root/noVNC

RUN sed -i '/http:\/\/dl-6.alpinelinux.org\/alpine\/edge\/testing/d' /etc/apk/repositories

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
echo "http://dl-3.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
echo "http://dl-5.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update upgrade && apk add ffmpeg build-base python python-dev py-pip

RUN pip install vnc2flv

RUN echo secret > passwd_file
