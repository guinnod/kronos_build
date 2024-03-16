#!/bin/bash

install_node_via_nvm() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    nvm install node
}

if ! command -v node > /dev/null; then
    echo "Node.js is not installed. Installing..."
    install_node_via_nvm
else
    echo "Node.js is already installed."
fi

npm install

sudo npm i -g serve

chmod +x kronos.sh

SERVICE_FILE=/etc/systemd/system/kronos.service

cat <<EOF >"$SERVICE_FILE"
[Unit]
Description=Kronos Startup Script

[Service]
ExecStart=$(pwd)/kronos.sh
WorkingDirectory=$(pwd)
StandardOutput=inherit
StandardError=inherit
Restart=always
User=$(whoami)

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload

systemctl enable kronos.service

systemctl start kronos.service

echo "kronos.service is enabled and started."
