.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/document-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/document-service:latest .

docker-run:
	docker run --rm -p 50201:50201 --env-file .env helixcare/document-service:latest
