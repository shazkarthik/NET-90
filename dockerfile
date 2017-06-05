FROM ubuntu:14.04

RUN /usr/bin/apt-get update

RUN /usr/bin/apt-get --yes upgrade

RUN /usr/bin/apt-get --yes install language-pack-en-base software-properties-common

RUN apt-get --yes update

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN /usr/bin/apt-get --yes install \
    build-essential \
    ca-certificates \
    curl \
    gettext \
    mariadb-client \
    mariadb-server \
    ssh \
    tmux \
    tree \
    unzip \
    vim \
    wget

RUN /bin/echo 'root:root' | /usr/sbin/chpasswd

ENV HOME /root

WORKDIR /root

EXPOSE 80 8443 21 22

RUN /usr/bin/apt-get --yes install php5
RUN /usr/bin/apt-get --yes remove apparmor
RUN /usr/bin/wget -O plesk-installer.sh http://autoinstall.plesk.com/plesk-installer
RUN chmod +x plesk-installer.sh
RUN /bin/bash /root/plesk-installer.sh

ENTRYPOINT ["/bin/bash"]
