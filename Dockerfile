# Stage 1: Build
FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build && rm -rf node_modules

# Stage 2: Production
FROM nginx:alpine

# Security updates
RUN apk update && apk upgrade && rm -rf /var/cache/apk/*

# Copy built files
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy nginx config to correct location
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
