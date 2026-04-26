.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/file-upload-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/file-upload-service:latest .

docker-run:
	docker run --rm -p 51011:51011 --env-file .env helixcare/file-upload-service:latest
