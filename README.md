# 🐳 Debian Java Containers with Fake Date Support

[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-mahtdev%2Fdebian--jdk21-blue)](https://hub.docker.com/r/mahtdev/debian-jdk21)
[![Java](https://img.shields.io/badge/Java-8%2C%2011%2C%2017%2C%2021-orange)](https://openjdk.java.net/)
[![Debian](https://img.shields.io/badge/Debian-12.12-red)](https://www.debian.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

Una colección de contenedores Docker basados en Debian con diferentes versiones de Java (JDK 8, 11, 17, 21) y funcionalidad avanzada para **simular fechas específicas** durante la ejecución de aplicaciones Java.

## ✨ Características

- 🐳 **Múltiples versiones de Java**: JDK 8, 11, 17, 21
- 📅 **Simulación de fechas**: Ejecuta aplicaciones Java con fechas simuladas
- 🛠️ **Herramientas incluidas**: Scripts para facilitar el uso
- 🔧 **Fácil configuración**: Scripts automatizados para construcción y despliegue
- 📚 **Documentación completa**: Guías detalladas y ejemplos
- 🚀 **Docker Hub**: Imágenes pre-construidas disponibles

## 🚀 Inicio Rápido

### Usar imagen pre-construida

```bash
# Descargar imagen con JDK 21
docker pull mahtdev/debian-jdk21:latest

# Ejecutar con fecha simulada
docker run --rm mahtdev/debian-jdk21:latest \
  run_java_fake_date.sh "2023-02-12 05:00:00" -jar mi_app.jar
```

### Construir localmente

```bash
# Clonar el repositorio
git clone https://github.com/mahtdev/debian-java-containers.git
cd debian-java-containers

# Construir imagen con JDK 21
./scripts/build/create_jdk21.sh

# Ejecutar demostración
docker run --rm mahtdev/debian-jdk21:12.12 demo_fake_date.sh
```

## 📋 Versiones Disponibles

| Versión | Java       | Debian | Docker Hub Tag                | Descripción                           |
| ------- | ---------- | ------ | ----------------------------- | ------------------------------------- |
| `jdk8`  | OpenJDK 8  | 12.12  | `mahtdev/debian-jdk8:latest`  | Java 8 con herramientas de desarrollo |
| `jdk11` | OpenJDK 11 | 12.12  | `mahtdev/debian-jdk11:latest` | Java 11 estándar                      |
| `jdk17` | OpenJDK 17 | 12.12  | `mahtdev/debian-jdk17:latest` | Java 17 LTS                           |
| `jdk21` | OpenJDK 21 | 12.12  | `mahtdev/debian-jdk21:latest` | Java 21 LTS con simulación de fechas  |

## 🎯 Casos de Uso

### 1. Testing de Aplicaciones con Fechas Específicas

```bash
# Probar aplicación en una fecha específica
docker run --rm -v $(pwd):/app mahtdev/debian-jdk21:latest \
  run_java_fake_date.sh "2023-02-12 05:00:00" -jar /app/mi_app.jar
```

### 2. Simulación de Escenarios Temporales

```bash
# Simular ejecución en el pasado
docker run --rm mahtdev/debian-jdk21:latest \
  run_java_fake_date.sh "2020-01-01 00:00:00" -jar app.jar

# Simular ejecución en el futuro
docker run --rm mahtdev/debian-jdk21:latest \
  run_java_fake_date.sh "2030-12-31 23:59:59" -jar app.jar
```

### 3. Desarrollo y Debugging

```bash
# Ejecutar con herramientas de desarrollo
docker run -it --rm mahtdev/debian-dev-jdk8:latest bash
```

## 🛠️ Herramientas Incluidas

### Scripts de Construcción

- `create_jdk8.sh` - Construye imagen con JDK 8
- `create_jdk11.sh` - Construye imagen con JDK 11
- `create_jdk17.sh` - Construye imagen con JDK 17
- `create_jdk21.sh` - Construye imagen con JDK 21

### Scripts de Simulación de Fechas

- `run_java_fake_date.sh` - Ejecuta Java con fecha simulada
- `demo_fake_date.sh` - Demostración de funcionalidad
- `TestDate.java` - Aplicación de ejemplo

### Scripts de Docker Hub

- `push_to_dockerhub.sh` - Sube imagen a Docker Hub
- `quick_push.sh` - Subida rápida
- `build_and_push.sh` - Construye y sube en un comando

## 📁 Estructura del Proyecto

```
debian-java-containers/
├── 📁 containers/           # Dockerfiles
│   ├── debian-jdk8
│   ├── debian-jdk11
│   ├── debian-jdk17
│   ├── debian-jdk21
│   └── debian-dev-jdk8
├── 📁 scripts/              # Scripts de automatización
│   ├── build/              # Scripts de construcción
│   ├── dockerhub/          # Scripts de Docker Hub
│   └── utils/              # Utilidades
├── 📁 packages/            # Archivos de Java (no incluidos)
├── 📁 docs/               # Documentación
├── 📁 examples/           # Ejemplos de uso
└── 📄 README.md
```

## 🔧 Instalación y Configuración

### Prerrequisitos

- Docker 20.10+
- Git
- Bash (Linux/macOS) o WSL (Windows)

### Configuración Inicial

```bash
# 1. Clonar el repositorio
git clone https://github.com/mahtdev/debian-java-containers.git
cd debian-java-containers

# 2. Descargar paquetes de Java (opcional)
# Los paquetes se descargan automáticamente durante la construcción

# 3. Construir imágenes
./scripts/build/create_jdk21.sh
```

### Configuración para Docker Hub

```bash
# Configurar credenciales
export DOCKER_USERNAME=tu_usuario
export DOCKER_PASSWORD=tu_token

# Subir imagen
./scripts/dockerhub/push_to_dockerhub.sh latest
```

## 📚 Documentación

- [Guía de Simulación de Fechas](docs/README_FAKE_DATE.md)
- [Scripts de Docker Hub](docs/DOCKERHUB.md)
- [Ejemplos de Uso](examples/)
- [API Reference](docs/API.md)

## 🧪 Ejemplos

### Ejemplo 1: Aplicación Spring Boot

```bash
# Ejecutar Spring Boot con fecha simulada
docker run --rm -v $(pwd):/app mahtdev/debian-jdk21:latest \
  run_java_fake_date.sh "2023-02-12 05:00:00" \
  -jar /app/spring-boot-app.jar --spring.profiles.active=test
```

### Ejemplo 2: Aplicación con Argumentos

```bash
# Ejecutar con configuración personalizada
docker run --rm -v $(pwd):/app mahtdev/debian-jdk21:latest \
  run_java_fake_date.sh "2023-02-12 05:00:00" \
  -jar /app/mi_app.jar --config=/app/config.properties --debug
```

### Ejemplo 3: Clase Java Individual

```bash
# Ejecutar clase específica
docker run --rm -v $(pwd):/app mahtdev/debian-jdk21:latest \
  run_java_fake_date.sh "2023-02-12 05:00:00" \
  -cp /app/classes com.ejemplo.MiAplicacion
```

## 🤝 Contribuir

Las contribuciones son bienvenidas! Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📝 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

## 🆘 Soporte

- 📧 **Email**: [support@maht.dev](mailto:support@maht.dev)
- 🐛 **Issues**: [GitHub Issues](https://github.com/mahtdev/debian-java-containers/issues)
- 📖 **Documentación**: [Wiki](https://github.com/mahtdev/debian-java-containers/wiki)

## 🙏 Agradecimientos

- [OpenJDK](https://openjdk.java.net/) - Java Development Kit
- [Debian](https://www.debian.org/) - Sistema operativo base
- [Docker](https://www.docker.com/) - Plataforma de contenedores
- [faketime](https://github.com/wolfcw/libfaketime) - Simulación de fechas

---

⭐ **¡Si este proyecto te es útil, considera darle una estrella!** ⭐
