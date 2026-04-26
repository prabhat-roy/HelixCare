.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/outbox-relay .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/outbox-relay:latest .

docker-run:
	docker run --rm -p 51002:51002 --env-file .env helixcare/outbox-relay:latest
