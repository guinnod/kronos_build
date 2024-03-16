#!/bin/bash

npm i -g serve

cd ./app
npm install
cd ../

sudo cp -r ./app /usr/local/bin
sudo chmod +x /usr/local/bin/app/kronos.sh
sudo cp kronos.service /etc/systemd/system/

systemctl daemon-reload

systemctl enable kronos.service

systemctl start kronos.service

echo "kronos.service is enabled and started."
