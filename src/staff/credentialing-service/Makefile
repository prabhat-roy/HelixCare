.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/credentialing-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/credentialing-service:latest .

docker-run:
	docker run --rm -p 50242:50242 --env-file .env helixcare/credentialing-service:latest
