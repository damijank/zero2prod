SHELL=/bin/bash

##
## config
APP_NAME=zero2prod

##
## docker
docker-build:
	docker build --tag ${APP_NAME} --file Dockerfile .
.PHONY: docker-build

docker-run:
	docker run -p 8000:8000 ${APP_NAME}
.PHONY: run

##
## development
check:
	cargo fmt && cargo deny check advisories && cargo clippy && cargo check && cargo test && cargo +nightly udeps
.PHONY: check

##
## local commands
local-spam-subscribers:
	./manual/spam-subscribers.sh
.PHONY: local-spam-subscribers

##
## DO commands
DO_APP_INFO=(doctl apps list --no-header --format ID,Spec.Name,DefaultIngress --output text | tr --squeeze-repeats ' ' | grep ' ${APP_NAME} ')
DO_APP_ID=(cut --delimiter ' ' --fields 1 - < <${DO_APP_INFO})
DO_APP_HOST=(cut --delimiter ' ' --fields 3 - < <${DO_APP_INFO})

do-app-info:
	${DO_APP_INFO}
.PHONY: do-app-info

do-create:
	doctl apps create --spec - < spec.yaml
.PHONY: do-create

do-update:
	doctl apps update $$${DO_APP_ID} --spec - < spec.yaml
.PHONY: do-update

do-spam-subscribers:
	SPAM_TEST_URL=$$${DO_APP_HOST} ./manual/spam-subscribers.sh
.PHONY: do-spam-subscribers

do-logs-follow:
	doctl apps logs $$${DO_APP_ID} ${APP_NAME} --follow --tail 10
.PHONY: do-logs-follow
