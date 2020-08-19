FROM debian:stable

RUN apt-get -q update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy sudo \
        vim less bc feh wget x11-utils \
        tigervnc-standalone-server \
        fluxbox rxvt-unicode x11-xserver-utils \
        firefox-esr && \
    apt-get clean && \
    rm -rf /var/cache/* /var/log/apt/* /var/lib/apt/lists/* /tmp/*

RUN useradd -m -s /bin/bash user && \
    echo "user ALL = NOPASSWD: ALL" > /etc/sudoers.d/user

ADD assets/startup /home/user/.startup
ADD assets/Xdefaults /home/user/.Xdefaults
ADD assets/fluxbox/init /home/user/.fluxbox/init
ADD assets/fluxbox/menu /home/user/.fluxbox/menu
RUN chown user:user -R ~user

USER user
WORKDIR /home/user
ENTRYPOINT /home/user/.startup
