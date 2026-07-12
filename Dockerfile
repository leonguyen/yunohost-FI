FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install systemd, curl, and networking requirements
RUN apt-get update && apt-get install -y \
    systemd \
    systemd-sysv \
    curl \
    ca-certificates \
    sudo \
    gnupg \
    iptables \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Prevent systemd from trying to load unnecessary physical hardware modules
RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/basic.target.wants/* \
    /lib/systemd/system/anaconda.target.wants/*

# Create the YunoHost installation script hook to run during container boot if not installed
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Inform systemd it is running in a container context
STOPSIGNAL SIGRTMIN+3
VOLUME [ "/sys/fs/cgroup" ]

ENTRYPOINT ["/entrypoint.sh"]
