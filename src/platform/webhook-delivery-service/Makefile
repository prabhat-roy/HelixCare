.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/webhook-delivery-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/webhook-delivery-service:latest .

docker-run:
	docker run --rm -p 51004:51004 --env-file .env helixcare/webhook-delivery-service:latest
