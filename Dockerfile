FROM alpine:3.13.5

RUN apk --no-cache --update --upgrade add \
        bash \
        python3 \
        python3-dev \
        gfortran \
        py-pip \
        build-base \
        procps \
        git

RUN pip install --no-cache-dir numpy

RUN git clone https://github.com/novnc/noVNC /root/noVNC && \
    git clone https://github.com/kanaka/websockify /root/noVNC/utils/websockify

ENTRYPOINT [ "bash", "/root/noVNC/utils/launch.sh" ]

