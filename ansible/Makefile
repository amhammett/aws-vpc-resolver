.PHONY: help test flake8 isort venv install

profile := dev
region := us-west-2

ifeq ($(OS),Windows_NT)
    python_path := $(shell where python)
    venv_pip_path := venv\Scripts\pip
else
    python_path := $(shell which python2.7)
    venv_ansible_path := AWS_PROFILE=$(profile) AWS_DEFAULT_REGION=$(region) ../venv/bin/ansible-playbook
    venv_pip_path := ../venv/bin/pip
endif

help: ## this help task
	@echo 'Available targets'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# ansible
playbook_vars := -e env=$(env)

deploy:
	$(venv_ansible_path) deploy.yml $(playbook_vars)

terminate:
	$(venv_ansible_path) terminate.yml $(playbook_vars)

test:
	$(venv_ansible_path) --version
