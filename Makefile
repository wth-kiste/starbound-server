NAME = wthkiste/starbound
VERSION = 1.0.4

.PHONY: build run debug config

build:
	docker build -t $(NAME):$(VERSION) .


run:
	docker run -d --name starbound -p 21025:21025 -p 21026:21026 -v starbound:/home/user/starbound/storage $(NAME):$(VERSION)

debug:
	docker run --rm -it -p 21025:21025 -p 21026:21026 -v starbound:/home/user/starbound/storage --entrypoint=/bin/bash $(NAME):$(VERSION)

config:
	docker run --rm -it -v starbound:/starbound alpine vi /starbound/starbound_server.config
