#
# Dockerfile to create AmigaOne X1000 CFE builder image
#
# The source code is assumed to be in
#  /opt/cfe
#
# which is also the work directory.
#

FROM ubuntu:xenial

LABEL maintainer="Steven Solie <steven@solie.ca>"

#
# This is where the source code is located and the build takes place.
#
WORKDIR /opt/cfe

#
# Note that multilib compilers are required because most of the code
# is 32 bit (-m32) but the host (Ubuntu) and target (Nemo) are both
# 64 bit.
#
RUN apt-get update && apt-get upgrade --yes && \
  apt-get install -y \
    make \
    gawk \
    gcc-4.8-multilib \
    gcc-4.8-powerpc-linux-gnu \
  && \
  ln -s /usr/bin/gcc-4.8 /usr/bin/gcc && \
  ln -s /usr/bin/powerpc-linux-gnu-gcc-4.8 /usr/bin/powerpc-linux-gnu-gcc && \
  ln -s /usr/bin/powerpc-linux-gnu-cpp-4.8 /usr/bin/powerpc-linux-gnu-cpp \
  && \
  rm -rf /var/lib/apt/lists/*
