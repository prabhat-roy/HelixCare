.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/audit-log-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/audit-log-service:latest .

docker-run:
	docker run --rm -p 51008:51008 --env-file .env helixcare/audit-log-service:latest
