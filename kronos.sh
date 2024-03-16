#!/bin/bash

sudo node server/app.bundle.js &
node_pid=$!

sudo serve -s public &
serve_pid=$!

wait $node_pid
wait $serve_pid
