.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/lab-order-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/lab-order-service:latest .

docker-run:
	docker run --rm -p 50100:50100 --env-file .env helixcare/lab-order-service:latest
