#!/bin/bash

cd ./app
npm install
cd ../

sudo cp -r ./app /usr/local/bin
sudo chmod +x /usr/local/bin/app/kronos.sh
sudo cp kronos.service /etc/systemd/system/

cd /usr/local/bin/app
sudo npm install -g serve@13.0.4

systemctl daemon-reload

systemctl enable kronos.service

systemctl start kronos.service

echo "kronos.service is enabled and started."
