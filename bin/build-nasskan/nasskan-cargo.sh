#!/usr/bin/env sh

export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true

apt-get update
apt-get install -y \
    git \
    rustc \
    build-essential \
    autoconf \
    pkg-config \
    libudev1 \
    libudev-dev \
    libtool \
    python3 \


git clone https://github.com/tadosappo/nasskan.git /tmp/nasskan
cd /tmp/nasskan
cargo build --release
cp /tmp/nasskan/target/release/nasskan /build/nasskan
