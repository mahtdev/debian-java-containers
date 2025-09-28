# Simulación de Fechas en Contenedores Java

Este proyecto incluye herramientas para simular fechas específicas cuando ejecutas aplicaciones Java en contenedores Docker.

## 🚀 Uso Rápido

### 1. Construir la imagen
```bash
cd /media/mahtdev/develop/projects/containers/debian
./containers/create_jdk21.sh
```

### 2. Ejecutar el contenedor
```bash
docker run -it --rm mahtdev/debian-jdk21:12.12
```

### 3. Dentro del contenedor, ejecutar la demostración
```bash
demo_fake_date.sh
```

## 📋 Métodos para Simular Fechas

### Método 1: Usando `run_java_fake_date.sh` (Recomendado)

```bash
# Ejecutar un JAR con fecha simulada
run_java_fake_date.sh "2023-02-12 05:00:00" -jar mi_aplicacion.jar

# Ejecutar una clase Java con fecha simulada
run_java_fake_date.sh "2023-02-12 05:00:00" -cp . MiClase

# Ejecutar con argumentos adicionales
run_java_fake_date.sh "2023-02-12 05:00:00" -jar mi_app.jar --config=prod.conf
```

### Método 2: Usando `faketime` directamente

```bash
# Formato básico
faketime "2023-02-12 05:00:00" java -jar mi_aplicacion.jar

# Con zona horaria específica
faketime "2023-02-12 05:00:00" java -Duser.timezone=UTC -jar mi_aplicacion.jar

# Con formato de fecha específico
faketime "2023-02-12 05:00:00" java -jar mi_aplicacion.jar
```

### Método 3: Usando variables de entorno Java

```bash
# Establecer zona horaria
export TZ=UTC
java -Duser.timezone=UTC -jar mi_aplicacion.jar

# Con fecha simulada
faketime "2023-02-12 05:00:00" java -Duser.timezone=UTC -jar mi_aplicacion.jar
```

## 🛠️ Herramientas Incluidas

- **`run_java_fake_date.sh`**: Script principal para ejecutar Java con fecha simulada
- **`run_with_fake_date.sh`**: Script genérico para cualquier comando con fecha simulada
- **`TestDate.java`**: Aplicación de ejemplo para probar la simulación
- **`demo_fake_date.sh`**: Script de demostración completo

## 📝 Ejemplos de Uso

### Ejemplo 1: Aplicación Spring Boot
```bash
run_java_fake_date.sh "2023-02-12 05:00:00" -jar spring-boot-app.jar --spring.profiles.active=test
```

### Ejemplo 2: Aplicación con argumentos
```bash
run_java_fake_date.sh "2023-02-12 05:00:00" -jar mi_app.jar --config=config.properties --debug
```

### Ejemplo 3: Clase Java específica
```bash
run_java_fake_date.sh "2023-02-12 05:00:00" -cp /app/classes com.ejemplo.MiAplicacion
```

## 🔧 Configuración Avanzada

### Zona Horaria
```bash
# Establecer zona horaria específica
export TZ=America/New_York
run_java_fake_date.sh "2023-02-12 05:00:00" -jar mi_app.jar
```

### Variables de Entorno Java
```bash
# Con propiedades del sistema
run_java_fake_date.sh "2023-02-12 05:00:00" -Duser.timezone=UTC -Djava.util.prefs.timezone=UTC -jar mi_app.jar
```

## 🐛 Solución de Problemas

### Error: "faketime: command not found"
```bash
# Instalar faketime
apt-get update && apt-get install -y faketime
```

### Error: "No se puede cambiar la fecha del sistema"
- Asegúrate de ejecutar el contenedor con privilegios suficientes
- Usa `faketime` en lugar de cambiar la fecha del sistema

### La fecha no se aplica correctamente
- Verifica que el formato de fecha sea correcto: "YYYY-MM-DD HH:MM:SS"
- Asegúrate de que la zona horaria esté configurada correctamente

## 📚 Notas Técnicas

- `faketime` intercepta las llamadas del sistema relacionadas con el tiempo
- Funciona con `System.currentTimeMillis()`, `new Date()`, `LocalDateTime.now()`, etc.
- No afecta el tiempo real del contenedor, solo la percepción de la aplicación Java
- Compatible con todas las versiones de Java (8, 11, 17, 21)

## 🎯 Casos de Uso Comunes

1. **Testing de aplicaciones** que dependen de fechas específicas
2. **Simulación de escenarios** en diferentes momentos del tiempo
3. **Debugging** de problemas relacionados con fechas
4. **Validación** de lógica de negocio temporal
5. **Demostraciones** que requieren fechas específicas
