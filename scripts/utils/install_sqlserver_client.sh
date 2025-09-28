#!/bin/bash

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/ubuntu/22.04/prod jammy main" > /etc/apt/sources.list.d/microsoft.list'

ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev

echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> /etc/bash.bashrc

