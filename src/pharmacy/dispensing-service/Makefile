.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/dispensing-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/dispensing-service:latest .

docker-run:
	docker run --rm -p 50123:50123 --env-file .env helixcare/dispensing-service:latest
