.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/rate-limit-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/rate-limit-service:latest .

docker-run:
	docker run --rm -p 51007:51007 --env-file .env helixcare/rate-limit-service:latest
