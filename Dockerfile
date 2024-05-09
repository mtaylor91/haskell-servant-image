FROM images.home.mtaylor.io/haskell:latest AS build

# Install system dependencies
USER root
RUN apt-get update && apt-get install -y libpq-dev zlib1g-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Haskell dependencies
USER build
RUN stack install --system-ghc --resolver lts-21.25 \
  aeson base64 bytestring case-insensitive ed25519 email-validate \
  hasql hasql-pool hasql-th hasql-transaction http-client http-client-tls \
  http-types lens mtl optparse-applicative servant-client servant-server \
  stm text uuid vector wai wai-websockets warp websockets
