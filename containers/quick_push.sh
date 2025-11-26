#!/bin/bash

# Script rápido para subir imagen a Docker Hub
# Muestra todas las imágenes disponibles y permite seleccionar una

echo "🚀 Subida rápida a Docker Hub"
echo "============================="
echo

# Verificar autenticación
if ! docker info | grep -q "Username:"; then
    echo "🔐 Iniciando sesión en Docker Hub..."
    docker login
    if [ $? -ne 0 ]; then
        echo "❌ Error: Falló la autenticación"
        exit 1
    fi
fi

# Buscar todas las imágenes locales de mahtdev
IMAGES=()
while IFS= read -r line; do
    if [[ $line =~ ^mahtdev/debian- ]]; then
        # Extraer nombre y tag
        if [[ $line =~ ^([^:]+):(.+)$ ]]; then
            IMAGE_NAME="${BASH_REMATCH[1]}"
            VERSION="${BASH_REMATCH[2]}"
            IMAGES+=("$IMAGE_NAME:$VERSION")
        fi
    fi
done < <(docker images --format "{{.Repository}}:{{.Tag}}" | grep "^mahtdev/debian-")

# Verificar si hay imágenes disponibles
if [ ${#IMAGES[@]} -eq 0 ]; then
    echo "❌ No se encontraron imágenes locales de mahtdev/debian-*"
    echo "💡 Construye primero las imágenes con los scripts de build"
    exit 1
fi

# Mostrar lista de imágenes disponibles
echo "📦 Imágenes disponibles:"
echo "----------------------"
INDEX=1
for img in "${IMAGES[@]}"; do
    echo "$INDEX. $img"
    ((INDEX++))
done
echo

# Solicitar selección
read -p "Selecciona el número de la imagen a publicar: " SELECTION

# Validar selección
if ! [[ "$SELECTION" =~ ^[0-9]+$ ]] || [ "$SELECTION" -lt 1 ] || [ "$SELECTION" -gt ${#IMAGES[@]} ]; then
    echo "❌ Error: Selección inválida. Debe ser un número entre 1 y ${#IMAGES[@]}"
    exit 1
fi

# Obtener imagen seleccionada
SELECTED_IMAGE="${IMAGES[$((SELECTION-1))]}"

# Extraer nombre y versión
if [[ $SELECTED_IMAGE =~ ^([^:]+):(.+)$ ]]; then
    COMPONENT="${BASH_REMATCH[1]}"
    VERSION="${BASH_REMATCH[2]}"
else
    echo "❌ Error: No se pudo parsear la imagen seleccionada"
    exit 1
fi

echo
echo "📦 Imagen seleccionada: $COMPONENT:$VERSION"
echo

# Verificar que la imagen existe localmente
if ! docker image inspect "$COMPONENT:$VERSION" &> /dev/null; then
    echo "❌ Error: La imagen local '$COMPONENT:$VERSION' no existe"
    exit 1
fi

# Confirmar publicación
echo "🔍 Se publicarán las siguientes versiones:"
echo "   1. $COMPONENT:$VERSION"
echo "   2. $COMPONENT:latest"
echo
read -p "¿Continuar con la publicación? (s/N): " CONFIRM

if [[ ! "$CONFIRM" =~ ^[sS]$ ]]; then
    echo "❌ Operación cancelada"
    exit 0
fi

echo
echo "🏷️  Creando tags y subiendo..."
echo

# Función para subir con reintentos
push_with_retry() {
    local image=$1
    local max_attempts=3
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        echo "📤 Intento $attempt/$max_attempts: Publicando $image..."
        
        if docker push "$image"; then
            echo "✅ $image publicado exitosamente"
            return 0
        else
            echo "⚠️  Intento $attempt falló"
            if [ $attempt -lt $max_attempts ]; then
                echo "⏳ Esperando 5 segundos antes de reintentar..."
                sleep 5
            fi
        fi
        
        ((attempt++))
    done
    
    echo "❌ Error: Falló después de $max_attempts intentos"
    return 1
}

# Publicar versión específica
if ! push_with_retry "$COMPONENT:$VERSION"; then
    echo "❌ No se pudo subir $COMPONENT:$VERSION"
    exit 1
fi
echo

# Crear tag latest y publicar
echo "🏷️  Creando tag latest..."
docker tag "$COMPONENT:$VERSION" "$COMPONENT:latest"

if ! push_with_retry "$COMPONENT:latest"; then
    echo "❌ No se pudo subir $COMPONENT:latest"
    exit 1
fi
echo

# Mostrar enlaces
REPO_NAME=$(echo "$COMPONENT" | cut -d'/' -f2)
echo "🎉 ¡Imágenes publicadas exitosamente!"
echo "🔗 https://hub.docker.com/r/$COMPONENT"
echo
echo "📋 Versiones publicadas:"
echo "   - $COMPONENT:$VERSION"
echo "   - $COMPONENT:latest"
