docker-build:
	docker build --tag zero2prod --file Dockerfile .
.PHONY: docker-build

docker-run:
	docker run -p 8000:8000 zero2prod
.PHONY: run

do-create:
	doctl apps create --spec - < spec.yaml
.PHONY: do-create

do-update:
	doctl apps update `doctl apps list --no-header --format Spec.Name,ID --output text | grep zero2prod | tr --squeeze-repeats ' ' | cut --delimiter ' ' --fields 2` --spec - < spec.yaml
.PHONY: do-update

check:
	cargo fmt && cargo clippy && cargo check && cargo test && cargo +nightly udeps
.PHONY: check
