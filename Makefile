docker-build:
	docker build --tag zero2prod --file Dockerfile .
.PHONY: docker-build

docker-run:
	docker run -p 8000:8000 zero2prod
.PHONY: run

do-create:
	doctl apps create --spec - < spec.yaml
.PHONY: do-create
