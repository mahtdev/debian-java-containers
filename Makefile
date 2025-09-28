# Debian Java Containers Makefile
# Common commands for development and deployment

.PHONY: help build push clean test demo

# Default target
help: ## Show this help message
	@echo "Debian Java Containers - Available Commands:"
	@echo "============================================="
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

# Build targets
build-jdk8: ## Build JDK 8 image
	@echo "Building JDK 8 image..."
	./scripts/build/create_jdk8.sh

build-jdk11: ## Build JDK 11 image
	@echo "Building JDK 11 image..."
	./scripts/build/create_jdk11.sh

build-jdk17: ## Build JDK 17 image
	@echo "Building JDK 17 image..."
	./scripts/build/create_jdk17.sh

build-jdk21: ## Build JDK 21 image
	@echo "Building JDK 21 image..."
	./scripts/build/create_jdk21.sh

build-all: build-jdk8 build-jdk11 build-jdk17 build-jdk21 ## Build all images

# Push targets
push-jdk8: ## Push JDK 8 image to Docker Hub
	@echo "Pushing JDK 8 image..."
	./scripts/dockerhub/push_to_dockerhub.sh jdk8 12.12

push-jdk11: ## Push JDK 11 image to Docker Hub
	@echo "Pushing JDK 11 image..."
	./scripts/dockerhub/push_to_dockerhub.sh jdk11 12.12

push-jdk17: ## Push JDK 17 image to Docker Hub
	@echo "Pushing JDK 17 image..."
	./scripts/dockerhub/push_to_dockerhub.sh jdk17 12.12

push-jdk21: ## Push JDK 21 image to Docker Hub
	@echo "Pushing JDK 21 image..."
	./scripts/dockerhub/push_to_dockerhub.sh jdk21 12.12

push-all: push-jdk8 push-jdk11 push-jdk17 push-jdk21 ## Push all images to Docker Hub

# Test targets
test-jdk8: ## Test JDK 8 image
	@echo "Testing JDK 8 image..."
	docker run --rm mahtdev/debian-jdk8:12.12 java -version

test-jdk11: ## Test JDK 11 image
	@echo "Testing JDK 11 image..."
	docker run --rm mahtdev/debian-jdk11:12.12 java -version

test-jdk17: ## Test JDK 17 image
	@echo "Testing JDK 17 image..."
	docker run --rm mahtdev/debian-jdk17:12.12 java -version

test-jdk21: ## Test JDK 21 image
	@echo "Testing JDK 21 image..."
	docker run --rm mahtdev/debian-jdk21:12.12 java -version

test-fake-date: ## Test fake date functionality
	@echo "Testing fake date functionality..."
	docker run --rm mahtdev/debian-jdk21:12.12 demo_fake_date.sh

test-all: test-jdk8 test-jdk11 test-jdk17 test-jdk21 test-fake-date ## Test all images

# Demo targets
demo: ## Run fake date demonstration
	@echo "Running fake date demonstration..."
	docker run --rm mahtdev/debian-jdk21:12.12 demo_fake_date.sh

demo-interactive: ## Run interactive demo
	@echo "Running interactive demo..."
	docker run -it --rm mahtdev/debian-jdk21:12.12 bash

# Development targets
dev-jdk8: ## Start JDK 8 development environment
	@echo "Starting JDK 8 development environment..."
	docker-compose --profile jdk8 up -d
	docker-compose exec jdk8-dev bash

dev-jdk21: ## Start JDK 21 development environment
	@echo "Starting JDK 21 development environment..."
	docker-compose --profile jdk21 up -d
	docker-compose exec jdk21 bash

# Clean targets
clean-images: ## Remove all local images
	@echo "Removing all local images..."
	docker rmi mahtdev/debian-jdk8:12.12 || true
	docker rmi mahtdev/debian-jdk11:12.12 || true
	docker rmi mahtdev/debian-jdk17:12.12 || true
	docker rmi mahtdev/debian-jdk21:12.12 || true

clean-containers: ## Remove all containers
	@echo "Removing all containers..."
	docker-compose down --remove-orphans

clean-all: clean-containers clean-images ## Clean everything

# Utility targets
shellcheck: ## Run shellcheck on all scripts
	@echo "Running shellcheck on all scripts..."
	find scripts/ -name "*.sh" -exec shellcheck {} \;

hadolint: ## Run hadolint on all Dockerfiles
	@echo "Running hadolint on all Dockerfiles..."
	find containers/ -name "*Dockerfile*" -o -name "debian-*" | xargs hadolint

lint: shellcheck hadolint ## Run all linters

# Quick targets
quick-build: build-jdk21 ## Quick build (JDK 21 only)
quick-push: push-jdk21 ## Quick push (JDK 21 only)
quick-test: test-jdk21 test-fake-date ## Quick test (JDK 21 only)

# Default target
.DEFAULT_GOAL := help
