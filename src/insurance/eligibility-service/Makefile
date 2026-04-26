.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/eligibility-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/eligibility-service:latest .

docker-run:
	docker run --rm -p 50180:50180 --env-file .env helixcare/eligibility-service:latest
