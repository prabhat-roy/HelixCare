.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/ward-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/ward-service:latest .

docker-run:
	docker run --rm -p 50221:50221 --env-file .env helixcare/ward-service:latest
