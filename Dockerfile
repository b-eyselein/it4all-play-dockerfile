# Scala and sbt Dockerfile
#
# Base dockerfile is hseeberger/scala-sbt (https://github.com/hseeberger/scala-sbt)
# with little tweaks to update to jdk 10
#

# Pull base image
FROM openjdk:10-jdk

# Env variables
ENV SCALA_VERSION 2.12.6
ENV SBT_VERSION 1.2.1

# Scala expects this file
# RUN touch /usr/lib/jvm/java-8-openjdk-amd64/release
RUN touch /usr/lib/jvm/java-10-openjdk-amd64/release

# Install Scala
## Piping curl directly in tar
RUN \
  curl -fsL https://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | tar xfz - -C /root/ && \
  echo >> /root/.bashrc && \
  echo "export PATH=~/scala-$SCALA_VERSION/bin:$PATH" >> /root/.bashrc

# Install sbt and nodejs
RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt update && \
  apt install -y sbt nodejs npm && \
  sbt sbtVersion

# Define working directory
WORKDIR /root

ENTRYPOINT /bin/bash
