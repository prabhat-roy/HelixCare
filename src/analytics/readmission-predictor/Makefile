.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/readmission-predictor .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t helixcare/readmission-predictor:latest .

docker-run:
	docker run --rm -p 50302:50302 --env-file .env helixcare/readmission-predictor:latest
