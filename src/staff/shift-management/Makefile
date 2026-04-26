.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/shift-management .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/shift-management:latest .

docker-run:
	docker run --rm -p 50240:50240 --env-file .env helixcare/shift-management:latest
