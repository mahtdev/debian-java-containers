# 🐳 Subir Imagen a Docker Hub

Este directorio contiene scripts para subir la imagen `mahtdev/debian-jdk21` a Docker Hub.

## 🚀 Scripts Disponibles

### 1. `push_to_dockerhub.sh` - Script Completo
Script completo con validaciones, autenticación automática y opciones avanzadas.

```bash
# Uso básico
./containers/push_to_dockerhub.sh

# Con tag personalizado
./containers/push_to_dockerhub.sh v1.0

# Con tag y versión personalizados
./containers/push_to_dockerhub.sh fake-date 12.12
```

### 2. `quick_push.sh` - Script Rápido
Script simple para subidas rápidas.

```bash
# Subir con tag 'latest'
./containers/quick_push.sh

# Subir con tag personalizado
./containers/quick_push.sh v1.0
```

## 🔐 Configuración de Autenticación

### Opción 1: Variables de Entorno (Recomendado)
```bash
export DOCKER_USERNAME=tu_usuario
export DOCKER_PASSWORD=tu_token_o_password
```

### Opción 2: Archivo de Configuración
```bash
# Copiar archivo de ejemplo
cp dockerhub.env.example dockerhub.env

# Editar con tus credenciales
nano dockerhub.env

# Cargar variables
source dockerhub.env
```

### Opción 3: Docker Login Manual
```bash
docker login
# Ingresa tu usuario y contraseña/token
```

## 🏷️ Tags Disponibles

| Tag | Descripción | Versión |
|-----|-------------|---------|
| `latest` | Última versión estable | 12.12 |
| `12.12` | Versión específica | 12.12 |
| `fake-date` | Con funcionalidad de fecha simulada | 12.12 |
| `v1.0` | Tag semántico personalizado | 12.12 |

## 📋 Ejemplos de Uso

### Subir con tag 'latest'
```bash
./containers/push_to_dockerhub.sh
```

### Subir con tag personalizado
```bash
./containers/push_to_dockerhub.sh fake-date
```

### Subir con versión específica
```bash
./containers/push_to_dockerhub.sh v1.0 12.12
```

### Subida rápida
```bash
./containers/quick_push.sh my-tag
```

## 🔗 Usar la Imagen Subida

Una vez subida, otros pueden usar tu imagen:

```bash
# Descargar la imagen
docker pull mahtdev/debian-jdk21:latest

# Ejecutar el contenedor
docker run -it --rm mahtdev/debian-jdk21:latest

# Ejecutar con fecha simulada
docker run --rm mahtdev/debian-jdk21:latest demo_fake_date.sh

# Ejecutar JAR con fecha simulada
docker run --rm -v $(pwd):/app mahtdev/debian-jdk21:latest \
  run_java_fake_date.sh "2023-02-12 05:00:00" -jar /app/mi_app.jar
```

## 🛠️ Comandos Docker Hub

### Verificar imagen local
```bash
docker images mahtdev/debian-jdk21
```

### Verificar imagen en Docker Hub
```bash
docker search mahtdev/debian-jdk21
```

### Probar imagen antes de subir
```bash
docker run --rm mahtdev/debian-jdk21:12.12 demo_fake_date.sh
```

## 🔧 Solución de Problemas

### Error: "denied: requested access to the resource is denied"
- Verifica que estés autenticado: `docker login`
- Verifica que tengas permisos para subir a `mahtdev/debian-jdk21`

### Error: "tag does not exist"
- Asegúrate de que la imagen local existe: `docker images`
- Ejecuta primero: `./create_jdk21.sh`

### Error: "authentication required"
- Configura las variables de entorno o ejecuta `docker login`
- Usa un Personal Access Token en lugar de la contraseña

## 📚 Enlaces Útiles

- [Docker Hub - mahtdev/debian-jdk21](https://hub.docker.com/r/mahtdev/debian-jdk21)
- [Docker Hub Personal Access Tokens](https://hub.docker.com/settings/security)
- [Docker Hub Documentation](https://docs.docker.com/docker-hub/)

## 🎯 Flujo de Trabajo Recomendado

1. **Desarrollar localmente**
   ```bash
   ./containers/create_jdk21.sh
   ```

2. **Probar la imagen**
   ```bash
   docker run --rm mahtdev/debian-jdk21:12.12 demo_fake_date.sh
   ```

3. **Subir a Docker Hub**
   ```bash
   ./containers/push_to_dockerhub.sh latest
   ```

4. **Verificar en Docker Hub**
   - Visita: https://hub.docker.com/r/mahtdev/debian-jdk21
   - Verifica que el tag aparezca correctamente

5. **Compartir con otros**
   ```bash
   docker pull mahtdev/debian-jdk21:latest
   ```
