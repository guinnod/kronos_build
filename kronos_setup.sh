#!/bin/bash

npm install

npm i -g serve

cp ./kronos.sh /usr/local/bin
chmod +x /usr/local/bin/kronos.sh
cp kronos.service /etc/systemd/system/

systemctl daemon-reload

systemctl enable kronos.service

systemctl start kronos.service

echo "kronos.service is enabled and started."
