.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/dead-letter-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/dead-letter-service:latest .

docker-run:
	docker run --rm -p 51010:51010 --env-file .env helixcare/dead-letter-service:latest
