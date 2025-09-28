# 📋 Scripts Disponibles

Este directorio contiene todos los scripts para gestionar las imágenes Docker.

## 🏗️ Scripts de Construcción

### `create_jdk21.sh`
Construye la imagen local `mahtdev/debian-jdk21:12.12`
```bash
./create_jdk21.sh
```

## 🚀 Scripts de Subida a Docker Hub

### `push_to_dockerhub.sh` - Script Completo
Script completo con validaciones, autenticación automática y opciones avanzadas.

```bash
# Uso básico
./push_to_dockerhub.sh

# Con tag personalizado
./push_to_dockerhub.sh v1.0

# Con tag y versión personalizados
./push_to_dockerhub.sh fake-date 12.12
```

**Características:**
- ✅ Validación de imagen local
- ✅ Autenticación automática
- ✅ Manejo de errores
- ✅ Limpieza opcional de tags locales
- ✅ Información detallada del proceso

### `quick_push.sh` - Script Rápido
Script simple para subidas rápidas.

```bash
# Subir con tag 'latest'
./quick_push.sh

# Subir con tag personalizado
./quick_push.sh v1.0
```

**Características:**
- ✅ Comando único
- ✅ Autenticación automática
- ✅ Ideal para desarrollo rápido

### `build_and_push.sh` - Todo en Uno
Construye la imagen y la sube a Docker Hub en un solo comando.

```bash
# Construir y subir con tag 'latest'
./build_and_push.sh

# Construir y subir con tag personalizado
./build_and_push.sh v1.0

# Construir versión específica y subir
./build_and_push.sh latest 13.0
```

**Características:**
- ✅ Construcción + subida en un comando
- ✅ Validaciones completas
- ✅ Ideal para CI/CD
- ✅ Manejo de errores en cada paso

## 🔐 Configuración de Autenticación

### Variables de Entorno (Recomendado)
```bash
export DOCKER_USERNAME=tu_usuario
export DOCKER_PASSWORD=tu_token_o_password
```

### Archivo de Configuración
```bash
# Copiar archivo de ejemplo
cp ../dockerhub.env.example dockerhub.env

# Editar con tus credenciales
nano dockerhub.env

# Cargar variables
source dockerhub.env
```

### Docker Login Manual
```bash
docker login
# Ingresa tu usuario y contraseña/token
```

## 📊 Comparación de Scripts

| Script | Construcción | Subida | Validaciones | Autenticación | Uso Recomendado |
|--------|-------------|--------|--------------|---------------|-----------------|
| `create_jdk21.sh` | ✅ | ❌ | ✅ | ❌ | Desarrollo local |
| `push_to_dockerhub.sh` | ❌ | ✅ | ✅ | ✅ | Subida manual |
| `quick_push.sh` | ❌ | ✅ | ⚠️ | ✅ | Subida rápida |
| `build_and_push.sh` | ✅ | ✅ | ✅ | ✅ | CI/CD, Producción |

## 🎯 Flujos de Trabajo Recomendados

### Desarrollo Local
```bash
# 1. Construir imagen
./create_jdk21.sh

# 2. Probar localmente
docker run --rm mahtdev/debian-jdk21:12.12 demo_fake_date.sh

# 3. Subir cuando esté listo
./push_to_dockerhub.sh latest
```

### Desarrollo Rápido
```bash
# Construir y subir en un comando
./build_and_push.sh v1.0
```

### CI/CD
```bash
# En tu pipeline
./build_and_push.sh $BUILD_TAG $VERSION
```

## 🛠️ Comandos Útiles

### Verificar imagen local
```bash
docker images mahtdev/debian-jdk21
```

### Probar imagen antes de subir
```bash
docker run --rm mahtdev/debian-jdk21:12.12 demo_fake_date.sh
```

### Verificar autenticación
```bash
docker info | grep Username
```

### Limpiar imágenes locales
```bash
docker rmi mahtdev/debian-jdk21:12.12
```

## 🔧 Solución de Problemas

### Error: "image does not exist"
```bash
# Construir la imagen primero
./create_jdk21.sh
```

### Error: "authentication required"
```bash
# Configurar credenciales
export DOCKER_USERNAME=tu_usuario
export DOCKER_PASSWORD=tu_token

# O hacer login manual
docker login
```

### Error: "permission denied"
```bash
# Verificar que tienes permisos para subir a mahtdev/debian-jdk21
# O cambiar el nombre de la imagen en los scripts
```

## 📚 Enlaces Útiles

- [Docker Hub - mahtdev/debian-jdk21](https://hub.docker.com/r/mahtdev/debian-jdk21)
- [Docker Hub Personal Access Tokens](https://hub.docker.com/settings/security)
- [Docker Hub Documentation](https://docs.docker.com/docker-hub/)
