FROM hseeberger/scala-sbt:11.0.4_1.3.4_2.13.1

# install nodejs and npm
RUN apt update && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt -y install build-essential nodejs npm chromium && \
    ln -s /usr/bin/chromium /usr/bin/chrome

ENV CHROME_BIN=/usr/bin/chromium

ENTRYPOINT /bin/bash
