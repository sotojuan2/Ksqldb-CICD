# Base image as Unbuntu
FROM ubuntu:latest

###################### BEGIN INSTALLATION #########################

######################### Set up environment ######################
RUN apt-get update
RUN apt install -y software-properties-common curl gnupg
RUN apt-cache search openjdk | grep openjdk-11
RUN apt update
RUN apt install --yes openjdk-11-jre
RUN curl -sq http://ksqldb-packages.s3.amazonaws.com/deb/0.28/archive.key |  apt-key add -
RUN add-apt-repository --yes 'deb http://ksqldb-packages.s3.amazonaws.com/deb/0.28 stable main'
RUN apt update
RUN apt install confluent-ksqldb