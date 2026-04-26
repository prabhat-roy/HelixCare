.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/population-health .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/population-health:latest .

docker-run:
	docker run --rm -p 50300:50300 --env-file .env helixcare/population-health:latest
