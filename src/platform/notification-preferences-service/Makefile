.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/notification-preferences-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/notification-preferences-service:latest .

docker-run:
	docker run --rm -p 51005:51005 --env-file .env helixcare/notification-preferences-service:latest
