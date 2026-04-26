.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/claim-submission .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/claim-submission:latest .

docker-run:
	docker run --rm -p 50182:50182 --env-file .env helixcare/claim-submission:latest
