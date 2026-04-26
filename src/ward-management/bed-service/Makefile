.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/bed-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/bed-service:latest .

docker-run:
	docker run --rm -p 50220:50220 --env-file .env helixcare/bed-service:latest
