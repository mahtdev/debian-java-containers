# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Initial project structure
- Support for Java 8, 11, 17, and 21
- Fake date simulation functionality
- Docker Hub integration scripts
- Comprehensive documentation
- GitHub Actions CI/CD pipeline
- Issue and PR templates

### Changed

- N/A

### Deprecated

- N/A

### Removed

- N/A

### Fixed

- N/A

### Security

- N/A

## [1.0.0] - 2024-01-XX

### Added

- 🐳 **Docker Images**: Debian-based containers with OpenJDK 8, 11, 17, and 21
- 📅 **Fake Date Support**: Simulate specific dates during Java application execution
- 🛠️ **Build Scripts**: Automated scripts for building Docker images
- 🚀 **Docker Hub Integration**: Scripts for pushing images to Docker Hub
- 📚 **Documentation**: Comprehensive guides and API reference
- 🔧 **Utility Scripts**: Helper scripts for common tasks
- 🧪 **Examples**: Working examples and demonstrations
- 🏗️ **CI/CD**: GitHub Actions workflow for automated builds
- 📋 **Templates**: Issue and PR templates for better collaboration

### Features

- **Multi-Java Support**: Choose from JDK 8, 11, 17, or 21
- **Date Simulation**: Use `faketime` to simulate specific dates
- **Easy Integration**: Simple scripts for common operations
- **Docker Hub Ready**: Pre-built images available on Docker Hub
- **Well Documented**: Complete documentation and examples
- **CI/CD Ready**: Automated builds and deployments

### Technical Details

- **Base Image**: Debian 12.12-slim
- **Java Versions**: OpenJDK 8, 11, 17, 21
- **Date Simulation**: libfaketime integration
- **Architecture**: x86_64 (AMD64)
- **Size**: Optimized for minimal footprint

### Scripts

- `create_jdk*.sh` - Build Docker images
- `run_java_fake_date.sh` - Execute Java with fake dates
- `push_to_dockerhub.sh` - Upload to Docker Hub
- `demo_fake_date.sh` - Demonstration script

### Documentation

- README.md - Main project documentation
- API.md - Script and function reference
- CONTRIBUTING.md - Contribution guidelines
- FAKE_DATE.md - Date simulation guide
- DOCKERHUB.md - Docker Hub usage guide

## [0.1.0] - 2024-01-XX

### Added

- Initial project setup
- Basic Dockerfile for JDK 21
- Simple build script
- Basic README

---

## Legend

- **Added** for new features
- **Changed** for changes in existing functionality
- **Deprecated** for soon-to-be removed features
- **Removed** for now removed features
- **Fixed** for any bug fixes
- **Security** for vulnerability fixes
