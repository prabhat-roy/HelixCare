.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/prescription-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/prescription-service:latest .

docker-run:
	docker run --rm -p 50120:50120 --env-file .env helixcare/prescription-service:latest
