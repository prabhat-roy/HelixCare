.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/po-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/po-service:latest .

docker-run:
	docker run --rm -p 50262:50262 --env-file .env helixcare/po-service:latest
