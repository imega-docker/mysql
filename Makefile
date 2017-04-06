# Build rootfs for mysql

DOCKER_RM = false

build:
	@docker run --rm \
		-v $(CURDIR)/runner:/runner \
		-v $(CURDIR)/build:/build \
		-v $(CURDIR)/src:/src \
		imega/base-builder \
		--packages="busybox zlib libstdc++" \
		--dev-packages="alpine-sdk lua-aports openssl openssl-dev bison ncurses-dev cmake"

test:
	@docker build -t imega/mysql-test:test .
	@docker run -d --name server_db imega/mysql-test:test
	@docker run --rm=$(DOCKER_RM) \
		-v $(CURDIR)/tests:/data \
		--link server_db:server \
		imega/mysql-client \
		mysql --host=server -e "source /data/dump.sql"

stop:
	@echo stop

.PHONY: build
