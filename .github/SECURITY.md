# Security Policy

## Supported Versions

We release patches for security vulnerabilities in the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

If you discover a security vulnerability, please follow these steps:

1. **Do NOT** create a public GitHub issue
2. **Do NOT** discuss the vulnerability publicly
3. **Email us directly** at [security@mahtdev.com](mailto:security@mahtdev.com)
4. **Include the following information:**
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

## Response Timeline

- **Acknowledgment**: Within 48 hours
- **Initial Assessment**: Within 7 days
- **Fix Development**: Within 30 days
- **Public Disclosure**: After fix is available

## Security Measures

### Docker Images

- Base images are regularly updated
- Security patches are applied promptly
- Images are scanned for vulnerabilities
- Minimal attack surface with slim base images

### Scripts

- All scripts are reviewed for security issues
- Input validation is implemented
- No hardcoded credentials
- Proper error handling

### Dependencies

- Dependencies are regularly updated
- Security advisories are monitored
- Automated dependency scanning

## Security Best Practices

### For Users

- Always use the latest version
- Verify image signatures
- Don't run containers as root
- Use secrets management for credentials
- Regularly update base images

### For Contributors

- Follow secure coding practices
- Validate all inputs
- Don't commit secrets or credentials
- Use security scanning tools
- Review code for security issues

## Security Contacts

- **Primary**: [security@mahtdev.com](mailto:security@mahtdev.com)
- **Backup**: [mahtdev@example.com](mailto:mahtdev@example.com)

## Acknowledgments

We appreciate the security research community and responsible disclosure practices. Thank you for helping keep our project secure!
