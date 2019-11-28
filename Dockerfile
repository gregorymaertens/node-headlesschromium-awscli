FROM debian:stable
FROM python:3.7

RUN apt-get update && apt-get install -y curl xvfb chromium
COPY pin_nodesource /etc/apt/preferences.d/nodesource

ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser

WORKDIR /usr/src/app

RUN apt-get install -y gpg \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs gpg \
    && rm -rf /var/lib/apt/lists

RUN pip install awscli
