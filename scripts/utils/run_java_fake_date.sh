#!/bin/bash

# Script simplificado para ejecutar Java con fecha simulada usando faketime
# Uso: run_java_fake_date.sh "2023-02-12 05:00:00" -jar mi_app.jar

if [ $# -lt 2 ]; then
    echo "Uso: $0 'YYYY-MM-DD HH:MM:SS' argumentos_java"
    echo "Ejemplo: $0 '2023-02-12 05:00:00' -jar mi_app.jar"
    echo "Ejemplo: $0 '2023-02-12 05:00:00' -cp . MiClase"
    exit 1
fi

FAKE_DATE="$1"
shift  # Remover el primer argumento (fecha) y dejar el resto como argumentos de Java

echo "🗓️  Simulando fecha: $FAKE_DATE"
echo "☕ Ejecutando: java $@"

# Usar faketime para simular la fecha
faketime "$FAKE_DATE" java "$@"
