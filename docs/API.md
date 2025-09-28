# API Reference

## Scripts de Construcción

### `create_jdk8.sh`

Construye la imagen Docker con OpenJDK 8.

```bash
./scripts/build/create_jdk8.sh
```

**Parámetros:** Ninguno  
**Salida:** Imagen `mahtdev/debian-jdk8:12.12`

### `create_jdk11.sh`

Construye la imagen Docker con OpenJDK 11.

```bash
./scripts/build/create_jdk11.sh
```

**Parámetros:** Ninguno  
**Salida:** Imagen `mahtdev/debian-jdk11:12.12`

### `create_jdk17.sh`

Construye la imagen Docker con OpenJDK 17.

```bash
./scripts/build/create_jdk17.sh
```

**Parámetros:** Ninguno  
**Salida:** Imagen `mahtdev/debian-jdk17:12.12`

### `create_jdk21.sh`

Construye la imagen Docker con OpenJDK 21.

```bash
./scripts/build/create_jdk21.sh
```

**Parámetros:** Ninguno  
**Salida:** Imagen `mahtdev/debian-jdk21:12.12`

## Scripts de Simulación de Fechas

### `run_java_fake_date.sh`

Ejecuta aplicaciones Java con fecha simulada.

```bash
run_java_fake_date.sh "YYYY-MM-DD HH:MM:SS" [argumentos_java]
```

**Parámetros:**

- `fecha`: Fecha en formato "YYYY-MM-DD HH:MM:SS"
- `argumentos_java`: Argumentos para el comando java

**Ejemplos:**

```bash
# Ejecutar JAR con fecha simulada
run_java_fake_date.sh "2023-02-12 05:00:00" -jar mi_app.jar

# Ejecutar clase con fecha simulada
run_java_fake_date.sh "2023-02-12 05:00:00" -cp . MiClase

# Ejecutar con argumentos adicionales
run_java_fake_date.sh "2023-02-12 05:00:00" -jar app.jar --config=prod.conf
```

### `demo_fake_date.sh`

Demostración de la funcionalidad de simulación de fechas.

```bash
demo_fake_date.sh
```

**Parámetros:** Ninguno  
**Descripción:** Ejecuta una demostración completa mostrando fechas normales y simuladas.

## Scripts de Docker Hub

### `push_to_dockerhub.sh`

Sube imagen a Docker Hub con validaciones completas.

```bash
./scripts/dockerhub/push_to_dockerhub.sh [tagname] [version]
```

**Parámetros:**

- `tagname`: Tag para la imagen (default: latest)
- `version`: Versión de la imagen (default: 12.12)

**Variables de entorno requeridas:**

- `DOCKER_USERNAME`: Usuario de Docker Hub
- `DOCKER_PASSWORD`: Token o contraseña de Docker Hub

### `quick_push.sh`

Subida rápida a Docker Hub.

```bash
./scripts/dockerhub/quick_push.sh [tagname]
```

**Parámetros:**

- `tagname`: Tag para la imagen (default: latest)

### `build_and_push.sh`

Construye y sube imagen en un solo comando.

```bash
./scripts/dockerhub/build_and_push.sh [tagname] [version]
```

**Parámetros:**

- `tagname`: Tag para la imagen (default: latest)
- `version`: Versión de la imagen (default: 12.12)

## Variables de Entorno

### Docker Hub

- `DOCKER_USERNAME`: Usuario de Docker Hub
- `DOCKER_PASSWORD`: Token o contraseña de Docker Hub

### Java

- `JAVA_HOME`: Directorio de instalación de Java
- `TZ`: Zona horaria del sistema

## Códigos de Salida

| Código | Descripción            |
| ------ | ---------------------- |
| 0      | Éxito                  |
| 1      | Error general          |
| 2      | Error de autenticación |
| 3      | Error de construcción  |
| 4      | Error de subida        |

## Ejemplos de Uso

### Construcción Local

```bash
# Construir imagen con JDK 21
./scripts/build/create_jdk21.sh

# Verificar imagen
docker images mahtdev/debian-jdk21
```

### Simulación de Fechas

```bash
# Ejecutar contenedor
docker run -it --rm mahtdev/debian-jdk21:12.12

# Dentro del contenedor
run_java_fake_date.sh "2023-02-12 05:00:00" -jar mi_app.jar
```

### Subida a Docker Hub

```bash
# Configurar credenciales
export DOCKER_USERNAME=mi_usuario
export DOCKER_PASSWORD=mi_token

# Subir imagen
./scripts/dockerhub/push_to_dockerhub.sh latest
```

## Troubleshooting

### Error: "image does not exist"

```bash
# Construir la imagen primero
./scripts/build/create_jdk21.sh
```

### Error: "authentication required"

```bash
# Configurar credenciales
export DOCKER_USERNAME=mi_usuario
export DOCKER_PASSWORD=mi_token
```

### Error: "faketime: command not found"

```bash
# La imagen ya incluye faketime, no es necesario instalarlo
# Verificar que estás usando la imagen correcta
docker run --rm mahtdev/debian-jdk21:12.12 which faketime
```
