#!/bin/bash

# Quitar validaciones
# shellcheck disable=SC2153
# shellcheck disable=SC2140
# shellcheck disable=SC2164

# Variables de entorno
COMPONENT="mahtdev/debian-jdk17"

# Leer la versión actual del archivo y incrementar el último dígito
if [ -f "$0" ]; then
    CURRENT_VERSION=$(grep -oP 'VERSION=\K[0-9]+\.[0-9]+\.[0-9]+' "$0" | head -1)
    MAJOR=$(echo "$CURRENT_VERSION" | cut -d. -f1)
    MINOR=$(echo "$CURRENT_VERSION" | cut -d. -f2)
    PATCH=$(echo "$CURRENT_VERSION" | cut -d. -f3)
    NEW_PATCH=$((PATCH + 1))
    VERSION="$MAJOR.$MINOR.$NEW_PATCH"
    
    # Actualizar el archivo con la nueva versión
    sed -i "s/VERSION=$CURRENT_VERSION/VERSION=$MAJOR.$MINOR.$NEW_PATCH/" "$0"
else
    VERSION=12.12.1
fi

# Eliminar todo lo creado anteriormente
docker rmi "$COMPONENT":"$VERSION"

# Crear imagen y guardarla en el disco
docker build -t "$COMPONENT":"$VERSION" -f debian-jdk17 .
if [ $? -ne 0 ]; then
    echo "ERROR - No se pudo crear la imagen, Saliendo..."
    exit 1
fi
sleep 3
