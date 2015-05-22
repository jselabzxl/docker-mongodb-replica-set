#
# MongoDB Dockerfile
#
# https://github.com/dockerfile/mongodb
#

# Pull base image.
FROM ubuntu:latest

# Install MongoDB.
RUN  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 
RUN  echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
RUN  apt-get update 
RUN  dpkg-divert --local --rename --add /sbin/initctl
RUN  ln -s /bin/true /sbin/initctl
RUN  apt-get install -y mongodb-org 
RUN  rm -rf /var/lib/apt/lists/*


RUN apt-get update
RUN apt-get install -f libnuma1 numactl

# Define mountable directories.
VOLUME ["/data/db"]

# Define working directory.
WORKDIR /

# Set timezone to Shanghai
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
