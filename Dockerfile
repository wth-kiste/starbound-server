FROM ubuntu:16.04



RUN set -x && apt-get -qq update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  lib32gcc1 libpng12-0 vim-tiny && \
  apt-get clean && rm -rf /var/lib/apt/lists/*


RUN set -x && useradd -m user

COPY server /home/user/starbound

RUN set -x && chown user:user -R /home/user/starbound && \
  chmod +x /home/user/starbound/linux/starbound_server

USER user

WORKDIR /home/user/starbound/linux

ENTRYPOINT ./starbound_server

