.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/geo-address-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/geo-address-service:latest .

docker-run:
	docker run --rm -p 51013:51013 --env-file .env helixcare/geo-address-service:latest
