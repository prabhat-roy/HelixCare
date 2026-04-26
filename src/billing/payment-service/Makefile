.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/payment-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/payment-service:latest .

docker-run:
	docker run --rm -p 50161:50161 --env-file .env helixcare/payment-service:latest
