# Build rootfs for mysql

DOCKER_RM = false

default: build

build:
	@docker run --rm \
		-v $(CURDIR)/runner:/runner \
		-v $(CURDIR)/build:/build \
		-v $(CURDIR)/src:/src \
		imega/base-builder \
		--packages="zlib libstdc++ libaio" \
		--dev-packages="alpine-sdk zlib-dev bison ncurses-dev cmake libtool readline-dev libaio-dev"

test:
	@docker build -t imega/mysql-test .
	@docker run -d --name server_db imega/mysql-test
	@docker run --rm=$(DOCKER_RM) \
		-v $(CURDIR)/tests:/data \
		--link server_db:server \
		imega/mysql-client \
		mysql --host=server -e "source /data/dump.sql"

.PHONY: build
