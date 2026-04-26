.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/email-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/email-service:latest .

docker-run:
	docker run --rm -p 50281:50281 --env-file .env helixcare/email-service:latest
