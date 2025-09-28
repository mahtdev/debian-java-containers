#!/bin/bash

# Script rápido para subir imagen a Docker Hub
# Uso: ./quick_push.sh [tagname]

# Variables
COMPONENT="mahtdev/debian-jdk21"
VERSION="12.12"
TAG_NAME="${1:-latest}"

echo "🚀 Subida rápida a Docker Hub"
echo "============================="
echo "📦 Imagen: $COMPONENT:$TAG_NAME"
echo

# Verificar que la imagen existe
if ! docker image inspect "$COMPONENT:$VERSION" &> /dev/null; then
    echo "❌ Error: La imagen local '$COMPONENT:$VERSION' no existe"
    echo "💡 Ejecuta primero: ./create_jdk21.sh"
    exit 1
fi

# Verificar autenticación
if ! docker info | grep -q "Username:"; then
    echo "🔐 Iniciando sesión en Docker Hub..."
    docker login
    if [ $? -ne 0 ]; then
        echo "❌ Error: Falló la autenticación"
        exit 1
    fi
fi

# Crear tag y subir
echo "🏷️  Creando tag y subiendo..."
docker tag "$COMPONENT:$VERSION" "$COMPONENT:$TAG_NAME" && \
docker push "$COMPONENT:$TAG_NAME"

if [ $? -eq 0 ]; then
    echo "✅ ¡Imagen subida exitosamente!"
    echo "🔗 https://hub.docker.com/r/mahtdev/debian-jdk21"
else
    echo "❌ Error al subir la imagen"
    exit 1
fi
