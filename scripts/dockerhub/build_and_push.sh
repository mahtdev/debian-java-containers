#!/bin/bash

# Script para construir y subir imagen a Docker Hub en un solo comando
# Uso: ./build_and_push.sh [tagname] [version]

# Quitar validaciones
# shellcheck disable=SC2153
# shellcheck disable=SC2140
# shellcheck disable=SC2164

# Variables
COMPONENT="mahtdev/debian-jdk21"
DEFAULT_VERSION="12.12"
DEFAULT_TAG="latest"

# Función para mostrar ayuda
show_help() {
    echo "🚀 Script para construir y subir imagen a Docker Hub"
    echo "=================================================="
    echo
    echo "Uso:"
    echo "  $0 [tagname] [version]"
    echo
    echo "Parámetros:"
    echo "  tagname   - Tag para la imagen (default: latest)"
    echo "  version   - Versión de la imagen (default: 12.12)"
    echo
    echo "Ejemplos:"
    echo "  $0                           # Construye y sube con tag 'latest'"
    echo "  $0 v1.0                     # Construye y sube con tag 'v1.0'"
    echo "  $0 latest 13.0              # Construye versión 13.0 y sube con tag 'latest'"
    echo "  $0 fake-date 12.12          # Construye versión 12.12 y sube con tag 'fake-date'"
    echo
    echo "Variables de entorno requeridas:"
    echo "  DOCKER_USERNAME - Usuario de Docker Hub"
    echo "  DOCKER_PASSWORD - Token/contraseña de Docker Hub"
}

# Verificar si se solicita ayuda
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
    exit 0
fi

# Cargar archivo .env si existe
if [[ -f .env ]]; then
    echo "📄 Cargando variables de entorno desde .env..."
    source .env
fi

# Obtener parámetros
TAG_NAME="${1:-$DEFAULT_TAG}"
VERSION="${2:-$DEFAULT_VERSION}"

echo "🚀 Construyendo y subiendo imagen a Docker Hub"
echo "=============================================="
echo "📦 Imagen: $COMPONENT"
echo "🏷️  Tag: $TAG_NAME"
echo "📋 Versión: $VERSION"
echo

# Paso 1: Construir la imagen
echo "🔨 Paso 1: Construyendo imagen..."
./create_jdk21.sh
if [ $? -ne 0 ]; then
    echo "❌ Error: Falló la construcción de la imagen"
    exit 1
fi
echo "✅ Imagen construida exitosamente"
echo

# Paso 2: Subir la imagen
echo "⬆️  Paso 2: Subiendo imagen a Docker Hub..."
./push_to_dockerhub.sh "$TAG_NAME" "$VERSION"
if [ $? -ne 0 ]; then
    echo "❌ Error: Falló la subida de la imagen"
    exit 1
fi

echo "🎉 ¡Proceso completado exitosamente!"
echo "=================================="
echo "🔗 Imagen disponible en: https://hub.docker.com/r/mahtdev/debian-jdk21"
echo "📦 Tag: $TAG_NAME"
echo "📋 Versión: $VERSION"
echo
echo "💡 Para usar la imagen:"
echo "   docker pull $COMPONENT:$TAG_NAME"
echo "   docker run -it --rm $COMPONENT:$TAG_NAME"
