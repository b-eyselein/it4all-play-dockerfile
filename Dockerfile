FROM hseeberger/scala-sbt:11.0.13_1.5.7_2.13.7

# install nodejs and npm
RUN apt update && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt -y install build-essential nodejs chromium && \
    ln -s /usr/bin/chromium /usr/bin/chrome

ENV CHROME_BIN=/usr/bin/chromium

ENTRYPOINT /bin/bash
