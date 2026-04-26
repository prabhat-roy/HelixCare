.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/consent-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/consent-service:latest .

docker-run:
	docker run --rm -p 50320:50320 --env-file .env helixcare/consent-service:latest
