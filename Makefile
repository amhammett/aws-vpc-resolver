.PHONY: help test flake8 isort venv install

profile := dev
region := us-west-2

ifeq ($(OS),Windows_NT)
    python_path := $(shell where python)
    venv_pip_path := venv\Scripts\pip
    virtualenv_path := python -m virtualenv
else
    python_path := $(shell which python2.7)
    venv_pip_path := ./venv/bin/pip
    virtualenv_path := virtualenv
endif

help: ## this help task
	@echo 'Available targets'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# environment
venv: ## virtual environment
	$(virtualenv_path) venv --python=$(python_path)

install: ## install all the things
	$(venv_pip_path) install -I pip
	$(venv_pip_path) install -r requirements.txt

# ansible
playbook_vars := profile=$(profile) region=$(region) env=$(env)

deploy:
	make -C ansible deploy $(playbook_vars)

terminate:
	make -C ansible terminate $(playbook_vars)

test:
	make -C ansible test
