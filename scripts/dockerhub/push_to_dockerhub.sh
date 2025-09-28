#!/bin/bash

# Script para subir imagen a Docker Hub
# Uso: ./push_to_dockerhub.sh [tagname] [version]

# Quitar validaciones
# shellcheck disable=SC2153
# shellcheck disable=SC2140
# shellcheck disable=SC2164

# Variables de entorno
COMPONENT="mahtdev/debian-jdk21"
DEFAULT_VERSION="12.12"
DEFAULT_TAG="latest"

# Función para mostrar ayuda
show_help() {
    echo "🚀 Script para subir imagen a Docker Hub"
    echo "========================================"
    echo
    echo "Uso:"
    echo "  $0 [tagname] [version]"
    echo
    echo "Parámetros:"
    echo "  tagname   - Tag para la imagen (default: latest)"
    echo "  version   - Versión de la imagen (default: 12.12)"
    echo
    echo "Ejemplos:"
    echo "  $0                           # Sube con tag 'latest' y versión '12.12'"
    echo "  $0 v1.0                     # Sube con tag 'v1.0' y versión '12.12'"
    echo "  $0 latest 13.0              # Sube con tag 'latest' y versión '13.0'"
    echo "  $0 fake-date 12.12          # Sube con tag 'fake-date' y versión '12.12'"
    echo
    echo "Variables de entorno requeridas:"
    echo "  DOCKER_USERNAME - Usuario de Docker Hub"
    echo "  DOCKER_PASSWORD - Token/contraseña de Docker Hub"
    echo
    echo "Nota: Se recomienda usar un Personal Access Token en lugar de la contraseña"
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

# Verificar que Docker esté instalado
if ! command -v docker &> /dev/null; then
    echo "❌ Error: Docker no está instalado o no está en el PATH"
    exit 1
fi

# Verificar que la imagen local existe
LOCAL_IMAGE="$COMPONENT:$VERSION"
if ! docker image inspect "$LOCAL_IMAGE" &> /dev/null; then
    echo "❌ Error: La imagen local '$LOCAL_IMAGE' no existe"
    echo "💡 Ejecuta primero: ./create_jdk21.sh"
    exit 1
fi

# Verificar variables de entorno para autenticación
if [[ -z "$DOCKER_USERNAME" || -z "$DOCKER_PASSWORD" ]]; then
    echo "❌ Error: Variables de entorno DOCKER_USERNAME y DOCKER_PASSWORD no están definidas"
    echo
    echo "💡 Configura las variables de entorno:"
    echo "   export DOCKER_USERNAME=tu_usuario"
    echo "   export DOCKER_PASSWORD=tu_token_o_password"
    echo
    echo "   O crea un archivo .env con:"
    echo "   DOCKER_USERNAME=tu_usuario"
    echo "   DOCKER_PASSWORD=tu_token_o_password"
    echo
    echo "   Luego ejecuta: source .env"
    exit 1
fi

echo "🐳 Subiendo imagen a Docker Hub"
echo "==============================="
echo "📦 Imagen: $COMPONENT"
echo "🏷️  Tag: $TAG_NAME"
echo "📋 Versión: $VERSION"
echo "🔗 Imagen completa: $COMPONENT:$TAG_NAME"
echo

# Autenticarse en Docker Hub
echo "🔐 Autenticándose en Docker Hub..."
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin
if [ $? -ne 0 ]; then
    echo "❌ Error: Falló la autenticación en Docker Hub"
    exit 1
fi
echo "✅ Autenticación exitosa"
echo

# Crear tag para la imagen
echo "🏷️  Creando tag '$TAG_NAME' para la imagen..."
docker tag "$LOCAL_IMAGE" "$COMPONENT:$TAG_NAME"
if [ $? -ne 0 ]; then
    echo "❌ Error: No se pudo crear el tag"
    exit 1
fi
echo "✅ Tag creado exitosamente"
echo

# Subir la imagen
echo "⬆️  Subiendo imagen a Docker Hub..."
docker push "$COMPONENT:$TAG_NAME"
if [ $? -ne 0 ]; then
    echo "❌ Error: Falló la subida de la imagen"
    exit 1
fi
echo "✅ Imagen subida exitosamente"
echo

# Mostrar información de la imagen subida
echo "🎉 ¡Imagen subida exitosamente!"
echo "==============================="
echo "🔗 Imagen: $COMPONENT:$TAG_NAME"
echo "🌐 URL: https://hub.docker.com/r/mahtdev/debian-jdk21"
echo
echo "📋 Comandos para usar la imagen:"
echo "   docker pull $COMPONENT:$TAG_NAME"
echo "   docker run -it --rm $COMPONENT:$TAG_NAME"
echo "   docker run --rm $COMPONENT:$TAG_NAME demo_fake_date.sh"
echo

# Limpiar tags locales si se desea
read -p "¿Deseas eliminar el tag local '$TAG_NAME'? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    docker rmi "$COMPONENT:$TAG_NAME"
    echo "✅ Tag local eliminado"
fi

echo "🏁 Proceso completado"
