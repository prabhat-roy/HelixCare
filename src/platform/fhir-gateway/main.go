package main

// fhir-gateway: HL7 FHIR R4 REST facade.
// - Translates internal gRPC calls to outbound FHIR Bundle JSON.
// - Enforces consent at the consumer boundary (calls consent-service).
// - Writes to audit-trail BEFORE every PHI read.
// - PHI rule: never log resource bodies; log a hashed FhirReference id only.

import (
	"context"
	"encoding/json"
	"log"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "50005"
	}
	mux := http.NewServeMux()
	mux.HandleFunc("/healthz", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		_ = json.NewEncoder(w).Encode(map[string]string{"status": "ok", "service": "fhir-gateway"})
	})
	mux.HandleFunc("/fhir/metadata", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/fhir+json")
		_ = json.NewEncoder(w).Encode(map[string]any{
			"resourceType": "CapabilityStatement",
			"fhirVersion":  "4.0.1",
			"status":       "active",
		})
	})
	srv := &http.Server{Addr: ":" + port, Handler: mux, ReadHeaderTimeout: 5 * time.Second}
	go func() { _ = srv.ListenAndServe() }()
	log.Printf("fhir-gateway listening on :%s", port)
	quit := make(chan os.Signal, 1)
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
	<-quit
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()
	_ = srv.Shutdown(ctx)
}
