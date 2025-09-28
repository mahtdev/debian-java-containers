#!/bin/bash

cd /opt/
tar -xvf *.tar.gz
rm *.tar.gz

carpeta=$(ls -d /opt/*)
mv $carpeta /opt/jdk-8

update-alternatives --install /usr/bin/java java /opt/jdk-8/bin/java 1
update-alternatives --install /usr/bin/javac javac /opt/jdk-8/bin/javac 1
update-alternatives --set java /opt/jdk-8/bin/java
update-alternatives --set javac /opt/jdk-8/bin/javac