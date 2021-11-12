-include .env
PROJECT_NAME = compose-infra

deploy:
	sam deploy --stack-name $(STACK_NAME) \
						 --capabilities CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND \
						 --no-fail-on-empty-changeset

destroy:
	sam delete --stack-name $(STACK_NAME) --no-prompts --region $$(aws configure get region)

# General settings
BRANCH_NAME != git rev-parse --abbrev-ref HEAD
BRANCH_ID ?= $(BRANCH_ID_CMD)
BRANCH_ID_CMD != echo $(BRANCH_NAME) | md5 | cut -c 1-7 -
STACK_NAME ?= $(if $(filter master main,$(BRANCH_NAME)),$(PROJECT_NAME),$(PROJECT_NAME)-$(BRANCH_ID))

# Make settings
.PHONY: *
.ONESHELL:
.SILENT:
SHELL=bash
.SHELLFLAGS=-ceo pipefail
MAKEFLAGS += --no-print-directory
export
