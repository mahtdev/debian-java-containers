#!/bin/bash

# Script de demostración para mostrar cómo simular fechas en Java
# Este script debe ejecutarse DENTRO del contenedor

echo "🚀 Demostración de Simulación de Fechas en Java"
echo "=============================================="
echo

# Cambiar al directorio de trabajo
cd /app

# Compilar el ejemplo
echo "📦 Compilando TestDate.java..."
javac TestDate.java
if [ $? -ne 0 ]; then
    echo "❌ Error al compilar TestDate.java"
    exit 1
fi
echo "✅ Compilación exitosa"
echo

# Mostrar fecha actual del sistema
echo "🕐 Fecha actual del sistema:"
date
echo

# Ejecutar con fecha normal
echo "📋 Ejecutando con fecha normal:"
java TestDate
echo

# Ejecutar con fecha simulada usando faketime
echo "🎭 Ejecutando con fecha simulada (2023-02-12 05:00:00):"
run_java_fake_date.sh "2023-02-12 05:00:00" TestDate
echo

# Ejecutar con otra fecha simulada
echo "🎭 Ejecutando con fecha simulada (2020-01-01 12:30:45):"
run_java_fake_date.sh "2020-01-01 12:30:45" TestDate
echo

# Mostrar cómo usar con un JAR
echo "📦 Para usar con un JAR:"
echo "   run_java_fake_date.sh '2023-02-12 05:00:00' -jar mi_aplicacion.jar"
echo

# Mostrar cómo usar con clase específica
echo "📦 Para usar con una clase específica:"
echo "   run_java_fake_date.sh '2023-02-12 05:00:00' -cp . MiClase"
echo

echo "🎉 Demostración completada"
