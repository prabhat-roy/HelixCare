// Astro config for HelixCare content-heavy public pages (marketing, docs, search)
import { defineConfig } from "astro/config";
import react from "@astrojs/react";
import sitemap from "@astrojs/sitemap";
export default defineConfig({
  site: "https://www.helixcare.internal",
  integrations: [react(), sitemap()],
  output: "hybrid",
  prefetch: { defaultStrategy: "viewport" },
});
