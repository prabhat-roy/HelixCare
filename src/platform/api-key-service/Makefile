.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/api-key-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/api-key-service:latest .

docker-run:
	docker run --rm -p 51003:51003 --env-file .env helixcare/api-key-service:latest
