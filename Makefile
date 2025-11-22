help: ## Show this help.
	@awk 'BEGIN {FS = ":.*?## "} /[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf " \033[36m%-20s\033[0m  %s\n", $$1, $$2}' $(MAKEFILE_LIST)

run: ## Run the application.
	@docker-compose up

rund: ## Run the application in detached mode.
	@docker-compose up -d

stop: ## Stop the application.
	@docker-compose down

clean: ## Clean the application.
	@docker-compose down -v

build-docker: ## Build the docker image.
	@docker build -t ghcr.io/pausegarra/auth:test .

.PHONY: help run rund stop clean build-docker