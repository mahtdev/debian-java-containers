#!/bin/bash

# Script de ejemplo completo para simular fechas en Java
# Este script construye la imagen y demuestra su uso

echo "🚀 Ejemplo de Simulación de Fechas en Java"
echo "=========================================="
echo

# Construir la imagen
echo "📦 Construyendo imagen Docker..."
./containers/create_jdk21.sh
if [ $? -ne 0 ]; then
    echo "❌ Error al construir la imagen"
    exit 1
fi
echo "✅ Imagen construida exitosamente"
echo

# Ejecutar el contenedor y mostrar la demostración
echo "🐳 Ejecutando contenedor con demostración..."
echo "   (Presiona Ctrl+C para salir del contenedor)"
echo

docker run -it --rm mahtdev/debian-jdk21:12.12 bash -c "
    echo '🎯 Ejecutando demostración de simulación de fechas...'
    echo
    demo_fake_date.sh
    echo
    echo '💡 Para usar con tu propia aplicación:'
    echo '   run_java_fake_date.sh \"2023-02-12 05:00:00\" -jar tu_app.jar'
    echo
    echo '   Presiona Enter para continuar o Ctrl+C para salir...'
    read
"
