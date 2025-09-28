# Contributing to Debian Java Containers

Thank you for your interest in contributing to this project! This document provides guidelines and information for contributors.

## 🤝 How to Contribute

### Reporting Issues

1. **Check existing issues** - Make sure the issue hasn't been reported already
2. **Use the issue template** - Fill out the bug report template completely
3. **Provide detailed information** - Include steps to reproduce, expected behavior, and environment details

### Suggesting Features

1. **Check existing feature requests** - Look for similar suggestions
2. **Use the feature request template** - Describe the problem and proposed solution
3. **Provide use cases** - Explain how the feature would be used

### Submitting Code

1. **Fork the repository**
2. **Create a feature branch** - `git checkout -b feature/amazing-feature`
3. **Make your changes** - Follow the coding standards
4. **Test your changes** - Ensure everything works correctly
5. **Commit your changes** - Use clear, descriptive commit messages
6. **Push to your fork** - `git push origin feature/amazing-feature`
7. **Open a Pull Request** - Use the PR template

## 📋 Development Setup

### Prerequisites

- Docker 20.10+
- Git
- Bash (Linux/macOS) or WSL (Windows)

### Local Development

```bash
# 1. Fork and clone the repository
git clone https://github.com/your-username/debian-java-containers.git
cd debian-java-containers

# 2. Add upstream remote
git remote add upstream https://github.com/mahtdev/debian-java-containers.git

# 3. Create a feature branch
git checkout -b feature/your-feature-name

# 4. Make your changes
# ... edit files ...

# 5. Test your changes
./scripts/build/create_jdk21.sh
docker run --rm mahtdev/debian-jdk21:12.12 demo_fake_date.sh

# 6. Commit and push
git add .
git commit -m "Add amazing feature"
git push origin feature/your-feature-name
```

## 🎯 Areas for Contribution

### High Priority

- [ ] Add support for more Java versions (JDK 22, etc.)
- [ ] Improve error handling in scripts
- [ ] Add more comprehensive tests
- [ ] Optimize Docker image sizes
- [ ] Add support for ARM64 architecture

### Medium Priority

- [ ] Add support for other base images (Alpine, Ubuntu)
- [ ] Create examples for different frameworks (Spring Boot, Quarkus, etc.)
- [ ] Add monitoring and logging capabilities
- [ ] Improve documentation
- [ ] Add CI/CD for multiple architectures

### Low Priority

- [ ] Add support for other languages (Python, Node.js, etc.)
- [ ] Create GUI tools
- [ ] Add performance benchmarks
- [ ] Create video tutorials

## 📝 Coding Standards

### Shell Scripts

- Use `#!/bin/bash` shebang
- Follow shellcheck recommendations
- Use meaningful variable names
- Add comments for complex logic
- Use `set -e` for error handling

### Dockerfiles

- Use specific base image tags
- Minimize layers
- Use `.dockerignore` files
- Add health checks where appropriate
- Document environment variables

### Documentation

- Use Markdown format
- Include code examples
- Keep it up to date
- Use clear, concise language

## 🧪 Testing

### Before Submitting

- [ ] Test all scripts locally
- [ ] Verify Docker images build correctly
- [ ] Test fake date functionality
- [ ] Check documentation for accuracy
- [ ] Run shellcheck on all scripts

### Test Commands

```bash
# Test image building
./scripts/build/create_jdk21.sh

# Test fake date functionality
docker run --rm mahtdev/debian-jdk21:12.12 demo_fake_date.sh

# Test Docker Hub scripts (with credentials)
./scripts/dockerhub/quick_push.sh test-tag

# Test shell scripts
shellcheck scripts/**/*.sh
```

## 📋 Pull Request Guidelines

### Before Submitting

- [ ] Code follows project standards
- [ ] All tests pass
- [ ] Documentation is updated
- [ ] Commit messages are clear
- [ ] PR description is complete

### PR Template

Use the provided PR template and fill out all sections:

- Description of changes
- Type of change
- Testing performed
- Checklist items

### Review Process

1. **Automated checks** - CI/CD pipeline runs
2. **Code review** - Maintainers review code
3. **Testing** - Changes are tested
4. **Approval** - PR is approved and merged

## 🏷️ Release Process

### Versioning

- Use semantic versioning (MAJOR.MINOR.PATCH)
- Update version numbers in all relevant files
- Create git tags for releases

### Release Checklist

- [ ] Update version numbers
- [ ] Update CHANGELOG.md
- [ ] Test all functionality
- [ ] Create release notes
- [ ] Tag the release
- [ ] Push to Docker Hub

## 🐛 Bug Reports

### Before Reporting

- [ ] Check existing issues
- [ ] Test with latest version
- [ ] Gather relevant information

### Bug Report Template

- **Title**: Clear, descriptive title
- **Description**: What happened vs. what was expected
- **Steps to reproduce**: Detailed steps
- **Environment**: OS, Docker version, Java version
- **Logs**: Relevant error messages
- **Screenshots**: If applicable

## 💡 Feature Requests

### Before Requesting

- [ ] Check existing feature requests
- [ ] Consider if it fits the project scope
- [ ] Think about implementation details

### Feature Request Template

- **Title**: Clear, descriptive title
- **Problem**: What problem does this solve?
- **Solution**: Proposed solution
- **Alternatives**: Other solutions considered
- **Use cases**: Specific examples

## 📞 Getting Help

### Communication Channels

- **GitHub Issues**: Bug reports and feature requests
- **GitHub Discussions**: General questions and ideas
- **Email**: [tu-email@ejemplo.com](mailto:tu-email@ejemplo.com)

### Response Times

- **Issues**: Within 48 hours
- **Pull Requests**: Within 72 hours
- **Discussions**: Within 24 hours

## 📜 Code of Conduct

### Our Pledge

We are committed to providing a welcoming and inclusive environment for all contributors.

### Expected Behavior

- Be respectful and inclusive
- Focus on what's best for the community
- Show empathy towards other community members
- Accept constructive criticism gracefully

### Unacceptable Behavior

- Harassment or discrimination
- Trolling or inflammatory comments
- Personal attacks or political discussions
- Spam or off-topic discussions

## 📄 License

By contributing to this project, you agree that your contributions will be licensed under the MIT License.

## 🙏 Recognition

Contributors will be recognized in:

- CONTRIBUTORS.md file
- Release notes
- Project documentation

Thank you for contributing to Debian Java Containers! 🎉
