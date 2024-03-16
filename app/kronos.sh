#!/bin/bash

node server/app.bundle.js &
node_pid=$!

serve -s public &
serve_pid=$!

wait $node_pid
wait $serve_pid
