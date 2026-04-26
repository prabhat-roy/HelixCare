.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/reminder-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/reminder-service:latest .

docker-run:
	docker run --rm -p 50062:50062 --env-file .env helixcare/reminder-service:latest
