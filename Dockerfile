# ideally this would use debian:jessie but something is wrong with the nodesource jessie
# repo and throws errors on install :(
FROM ubuntu:14.04
RUN apt-get update && apt-get install -y --no-install-recommends \
    python \
    python-dev \
    make \
    gcc \
    g++ \
    libavahi-compat-libdnssd-dev \
    libasound2-dev \
    ca-certificates \
    curl
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs
COPY . /app
RUN (cd /app && npm install)
WORKDIR /app
ENTRYPOINT ["node"]
CMD ["index.js"]
