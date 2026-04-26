.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/order-management .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/order-management:latest .

docker-run:
	docker run --rm -p 50083:50083 --env-file .env helixcare/order-management:latest
