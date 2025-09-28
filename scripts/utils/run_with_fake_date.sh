#!/bin/bash

# Script para ejecutar aplicaciones Java con fecha simulada
# Uso: run_with_fake_date.sh "2023-02-12 05:00:00" java -jar mi_app.jar

if [ $# -lt 2 ]; then
    echo "Uso: $0 'YYYY-MM-DD HH:MM:SS' comando_java"
    echo "Ejemplo: $0 '2023-02-12 05:00:00' java -jar mi_app.jar"
    exit 1
fi

FAKE_DATE="$1"
shift  # Remover el primer argumento (fecha) y dejar el resto como comando

echo "Simulando fecha: $FAKE_DATE"
echo "Ejecutando comando: $@"

# Opción 1: Usar faketime (si está disponible)
if command -v faketime &> /dev/null; then
    echo "Usando faketime..."
    faketime "$FAKE_DATE" "$@"
else
    # Opción 2: Usar date para cambiar la fecha del sistema temporalmente
    echo "Cambiando fecha del sistema temporalmente..."
    
    # Guardar fecha actual
    ORIGINAL_DATE=$(date)
    
    # Cambiar fecha del sistema
    date -s "$FAKE_DATE" 2>/dev/null || {
        echo "Error: No se pudo cambiar la fecha del sistema. Intentando con faketime..."
        # Instalar faketime si es posible
        apt-get update && apt-get install -y faketime
        if command -v faketime &> /dev/null; then
            faketime "$FAKE_DATE" "$@"
        else
            echo "Error: No se puede simular la fecha. Ejecutando con fecha actual."
            "$@"
        fi
        exit $?
    }
    
    # Ejecutar el comando
    "$@"
    EXIT_CODE=$?
    
    # Restaurar fecha original
    date -s "$ORIGINAL_DATE" 2>/dev/null || echo "Advertencia: No se pudo restaurar la fecha original"
    
    exit $EXIT_CODE
fi
