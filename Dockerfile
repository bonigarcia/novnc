FROM alpine:3.13.5

ENV NOVNC_TAG="v1.2.0"

ENV WEBSOCKIFY_TAG="v0.9.0"

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

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN git config --global advice.detachedHead false && \
    git clone https://github.com/novnc/noVNC --branch ${NOVNC_TAG} /root/noVNC && \
    git clone https://github.com/novnc/websockify --branch ${WEBSOCKIFY_TAG} /root/noVNC/utils/websockify

ENTRYPOINT [ "bash", "/root/noVNC/utils/launch.sh" ]

