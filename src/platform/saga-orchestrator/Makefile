.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/saga-orchestrator .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/saga-orchestrator:latest .

docker-run:
	docker run --rm -p 51001:51001 --env-file .env helixcare/saga-orchestrator:latest
