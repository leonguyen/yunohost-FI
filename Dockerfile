FROM debian:12

ENV DEBIAN_FRONTEND=noninteractive
ENV container=docker

STOPSIGNAL SIGRTMIN+3

RUN apt-get update && \
    apt-get install -y \
    systemd systemd-sysv dbus sudo curl wget gnupg2 \
    ca-certificates lsb-release locales && \
    apt-get clean

VOLUME [ "/sys/fs/cgroup" ]

RUN mkdir -p /etc/systemd/system/sysinit.target.wants && \
    ln -sf /lib/systemd/system/systemd-tmpfiles-setup.service \
    /etc/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup.service

RUN curl https://install.yunohost.org | bash

RUN systemctl disable systemd-resolved.service || true

EXPOSE 80 443

CMD ["/sbin/init"]
