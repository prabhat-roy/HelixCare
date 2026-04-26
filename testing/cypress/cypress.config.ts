import { defineConfig } from 'cypress';

export default defineConfig({
  e2e: {
    baseUrl: process.env.BASE_URL ?? 'https://staging.helixcare.com',
    specPattern: 'cypress/e2e/**/*.cy.{js,ts}',
    supportFile: false,
    video: false,
    screenshotOnRunFailure: true,
    retries: { runMode: 2, openMode: 0 },
  },
});
