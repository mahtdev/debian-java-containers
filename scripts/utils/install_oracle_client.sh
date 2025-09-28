#!/bin/bash

# Ruta de la carpeta que contiene los archivos

carpeta="/opt"
cd "$carpeta"
mkdir -p /opt/oracle

wget https://download.oracle.com/otn_software/linux/instantclient/2360000/instantclient-basic-linux.x64-23.6.0.24.10.zip
wget https://download.oracle.com/otn_software/linux/instantclient/2350000/instantclient-sqlplus-linux.x64-23.6.0.24.10.zip
wget https://download.oracle.com/otn_software/linux/instantclient/2360000/instantclient-sdk-linux.x64-23.6.0.24.10.zip

# Recorrer todos los archivos en la carpeta
for archivo in "$carpeta"/*; do
    # Verificar que sea un archivo y no un directorio
    if [ -f "$archivo" ]; then
        # Descomprimir el archivo
        unzip -o "$archivo" -d "$carpeta/oracle/"
        rm "$archivo"
    fi
done

for carpeta in "$carpeta/oracle"/*/; do
    # Obtener el nombre de la carpeta sin la ruta completa
    nombre_carpeta=$(basename "$carpeta")

    # Verificar si el nombre no es "META-INF"
    if [ "$nombre_carpeta" != "META-INF" ]; then
        # Imprimir el nombre de la carpeta
        echo "Carpeta encontrada: $nombre_carpeta"
        export LD_LIBRARY_PATH="/opt/oracle/$nombre_carpeta:$LD_LIBRARY_PATH"
        export PATH="/opt/oracle/$nombre_carpeta:$PATH"
        export ORACLE_HOME="/opt/oracle/$nombre_carpeta"
        echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH" >> /etc/bash.bashrc       
        echo "export PATH=$PATH" >> /etc/bash.bashrc        
    fi
done