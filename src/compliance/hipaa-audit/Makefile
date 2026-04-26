.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/hipaa-audit .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/hipaa-audit:latest .

docker-run:
	docker run --rm -p 50322:50322 --env-file .env helixcare/hipaa-audit:latest
