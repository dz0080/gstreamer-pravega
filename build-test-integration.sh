#!/usr/bin/env bash

cargo build --package gst-plugin-pravega --locked --release
sudo cp target/release/*.so /usr/lib/x86_64-linux-gnu/gstreamer-1.0/

gst-inspect-1.0 pravega

pushd integration-test
cargo test --release --locked $* -- --skip ignore --list
cargo test --locked --release -- --test $*
popd