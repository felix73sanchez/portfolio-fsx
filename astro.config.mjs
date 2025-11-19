import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';

export default defineConfig({
  integrations: [mdx()],
  output: 'static',
  site: 'http://fsxsys.dpdns.org',
  server: {
    port: 4321,
    host: true
  },
  vite: {
    server: {
      watch: {
        usePolling: true
      }
    }
  }
});