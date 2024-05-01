FROM images.home.mtaylor.io/base:latest
RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential curl git libffi-dev libffi8 libgmp-dev libgmp10  \
  libncurses-dev libncurses5 libtinfo5 \
  && rm -rf /var/lib/apt/lists/*
RUN adduser --home /build build
USER build
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
ENV PATH=/build/.cabal/bin:/build/.ghcup/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN mkdir /build/workspace
WORKDIR /build/workspace
