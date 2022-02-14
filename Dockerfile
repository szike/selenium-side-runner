FROM alpine:latest

# Switch to edge (for latest firefox)
RUN sed -i -e 's/v[[:digit:]]\.[[:digit:]]*/edge/g' /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk update && apk upgrade

# Firefox 
RUN apk add firefox-esr jq curl 
RUN rm -rf /var/cache/apk/*

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz \
  && tar -zxf geckodriver-v0.30.0-linux64.tar.gz -C /usr/bin

# Chromium
RUN apk add chromium chromium-chromedriver
RUN rm -rf /var/cache/apk/*

# Selenium Side Runner
RUN set -eux \
  && apk add --update --no-cache \
     nodejs \
     npm \
  && npm install -g selenium-side-runner

# Wrapper Scripts
ADD firefox-runner /usr/local/bin/firefox-runner
RUN chmod +x /usr/local/bin/firefox-runner

ADD chromium-runner /usr/local/bin/chromium-runner
RUN chmod +x /usr/local/bin/chromium-runner

RUN mkdir /selenium

WORKDIR /selenium

VOLUME [ "/selenium" ]

