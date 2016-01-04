# Pull base image
FROM hypriot/rpi-java:1.8.0
MAINTAINER Dieter Reuter <dieter@hypriot.com>

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ENV CRATE_VERSION 0.54.1
RUN mkdir -p /crate && \
  wget -nv --no-check-certificate -O - "https://cdn.crate.io/downloads/releases/crate-$CRATE_VERSION.tar.gz" \
  | tar -xzC /crate --strip-components=1

ENV PATH /crate/bin:$PATH

VOLUME ["/data"]

ADD config/crate.yml /crate/config/crate.yml
ADD config/logging.yml /crate/config/logging.yml

WORKDIR /data

# http
EXPOSE 4200
# transport
EXPOSE 4300

CMD ["crate"]
