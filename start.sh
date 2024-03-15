#!/bin/bash

install_dependencies=true

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --skip-install)
            install_dependencies=false
            shift # past argument
            ;;
        *)
            # unknown option
            ;;
    esac
    shift # past argument or value
done

# Install dependencies if the flag is not set to skip installation
if [ "$install_dependencies" = true ]; then
    sudo npm install
    sudo npm i -g serve
fi

sudo node back/app.bundle.js &
node_pid=$!

sudo serve -s frontend &
serve_pid=$!

wait $node_pid
wait $serve_pid
