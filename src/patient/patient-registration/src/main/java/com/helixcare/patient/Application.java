package com.helixcare.patient;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * patient-registration: enrolment, MRN issuance, demographics.
 *
 * PHI rule: never log MRN, DOB, or full name. Use the audit-trail service
 * (helixcare.ehr.v1.AuditTrailService) for any PHI access record.
 */
@SpringBootApplication
public class Application {
    public static void main(String[] args) { SpringApplication.run(Application.class, args); }

    @RestController
    static class HealthController {
        @GetMapping("/healthz")
        public Map<String,String> health() {
            return Map.of("status","ok","service","patient-registration");
        }
    }
}
