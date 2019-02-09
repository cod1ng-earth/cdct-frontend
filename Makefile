
include ./hack/help.mk

UID:=$(shell id -u)
GID:=$(shell id -g)
PWD:=$(shell pwd)
UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Linux)
	OS="LINUX"
	OPEN=x-www-browser
endif
ifeq ($(UNAME_S),Darwin)
	OS="OSX"
	OPEN=open
endif

CLI = docker-compose exec -T cli


.PHONY: setup
setup:##@setup Create dev environment
	docker-compose up -d cli;
	$(CLI) yarn install


.PHONY: serve
serve: ##@dev start and listen to vue dev server, quit will stop it
	docker-compose exec cli sh -c "yarn con";


.PHONY: cli
cli: ##@dev start cli container
	if [ -z `docker ps -q --no-trunc | grep $$(docker-compose ps -q cli)` ]; then \
		docker-compose up -d cli; \
	fi;
	docker-compose exec cli sh;


.PHONY: mock
mock: ##@dev start the mock server
	docker-compose up -d mock_api;
	docker-compose up -d mock_api_proxy;


#.PHONY: open
#open: ##@dev open in browser
#	$(OPEN) http://localhost:6793

