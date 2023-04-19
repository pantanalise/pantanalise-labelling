
.PHONY: help
help:  ## Show the help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
.DEFAULT_GOAL := help


.PHONY: build-no-cache
build-no-cache: ## build image with any cache
	@docker-compose build --no-cache --pull ${BUILD_ARGS}

.PHONY: shell
shell: ## Shell developer
	@docker-compose exec -ti labeler bash

.PHONY: up
up: ## Create if necessary all container infrastructure
	@docker-compose up

.PHONY: up-daemon
up-daemon: ## Create if necessary all container infrastructure in daemon mode
	@docker-compose up -d

.PHONY: down
down: ## Destroy all containers and infrastructure create for containers
	@docker-compose down

.PHONY: stop
stop: ## Stop all containers
	@docker-compose stop

.PHONY: restart
restart: ##  Restart all containers
	@docker-compose restart