#!/bin/bash

node back/app.bundle.js &
serve -s front &

wait $node_pid
wait $serve_pid
