.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/i18n-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/i18n-service:latest .

docker-run:
	docker run --rm -p 51012:51012 --env-file .env helixcare/i18n-service:latest
