.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/copay-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/copay-service:latest .

docker-run:
	docker run --rm -p 50162:50162 --env-file .env helixcare/copay-service:latest
