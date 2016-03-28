############################################################
# Dockerfile to build Rust container images
# Based on Ubuntu 15.04
############################################################

FROM ubuntu
MAINTAINER Rahul Sharma <rsconceptx@gmail.com>
# Update the dist
RUN sudo apt-get update

# rustup needs curl
RUN sudo apt-get install -y curl
# build-essential
RUN sudo apt-get install -y build-essential

# Setup rustup - https://www.rustup.rs
RUN curl https://sh.rustup.rs -sSf | sh
RUN rustup update
RUN rustup update nightly

# Change Directory to project
VOLUME [ "/project" ]
WORKDIR /project

# Switch default to nightly coz, more action there. :D
rustup default nightly
