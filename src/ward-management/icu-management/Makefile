.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/icu-management .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/icu-management:latest .

docker-run:
	docker run --rm -p 50222:50222 --env-file .env helixcare/icu-management:latest
