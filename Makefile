# Project variables
DOCKER_REPO_NAME ?= api.hungrig.se-nginx
DOCKER_ORG_NAME ?= hungrigse

BUILD_TAG ?= build
PUBLISH_TAG ?= latest

.PHONY: build
build:
	${INFO} "Building..."
	@ docker build --pull --tag $(DOCKER_REPO_NAME):$(BUILD_TAG) -f docker/Dockerfile .
	${INFO} "Build complete!"

.PHONY: publish
publish:
	${INFO} "Tagging image.."
	@ docker tag $(DOCKER_REPO_NAME):$(BUILD_TAG) $(DOCKER_ORG_NAME)/$(DOCKER_REPO_NAME):$(PUBLISH_TAG)
	${INFO} "Pushing image..."
	@ docker push $(DOCKER_ORG_NAME)/$(DOCKER_REPO_NAME):$(PUBLISH_TAG)
	${INFO} "Image published!"

# Cosmetics
YELLOW := "\e[1;33m"
NC := "\e[0m"

# Shell Functions
INFO := @bash -c '\
  printf $(YELLOW); \
  echo "=> $$1"; \
  printf $(NC)' SOME_VALUE
