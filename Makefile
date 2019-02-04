
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


# .PHONY: serve
# serve: ##@dev start api mock server
# 	docker build -t json-server docker/json-server
# 	docker run -it --rm -v "$(PWD)/data:/data" -w /data -u "$(UID):$(GID)" -p 9988:9988 json-server --watch db.json -p 9988 --host 0.0.0.0


.PHONY: cli
cli: ##@dev start cli container
	if [ -z `docker ps -q --no-trunc | grep $$(docker-compose ps -q cli)` ]; then \
		docker-compose up -d cli; \
	fi;
	docker-compose exec cli sh;


#.PHONY: open
#open: ##@dev open in browser
#	$(OPEN) http://localhost:6793

