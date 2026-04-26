.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/medical-supply-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/medical-supply-service:latest .

docker-run:
	docker run --rm -p 50260:50260 --env-file .env helixcare/medical-supply-service:latest
