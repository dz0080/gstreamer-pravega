#!/usr/bin/env bash

set -ex
ROOT_DIR=$(readlink -f $(dirname $0)/..)

# Multiple test threads can be used but troubleshooting is easier with just 1 thread.
# When increasing this, we recommend using a Pravega server started with ../pravega-docker/up.sh
# to better handle the high load.
TEST_THREADS=${TEST_THREADS:-1}

# pushd ${ROOT_DIR}
# cargo build --package gst-plugin-pravega --locked --release
# sudo cp target/release/*.so /usr/lib/x86_64-linux-gnu/gstreamer-1.0/

# gst-inspect-1.0 pravega
# popd

pushd ${ROOT_DIR}/integration-test
# cargo test --release --locked $* -- --skip ignore --list
cargo test --locked --release -- --test-threads=${TEST_THREADS} --test $*
popd