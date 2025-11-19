# Stage 1: Dependencies
FROM node:22-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production && \
    npm cache clean --force

# Stage 2: Builder
FROM node:22-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build && \
    rm -rf node_modules

# Stage 3: Production
FROM nginx:alpine AS production

# Install security updates
RUN apk update && \
    apk upgrade && \
    apk add --no-cache tzdata && \
    rm -rf /var/cache/apk/*

# Create non-root user
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

# Copy built assets from builder stage
COPY --from=builder --chown=nodejs:nodejs /app/dist /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Remove default nginx config
RUN rm -f /etc/nginx/conf.d/default.conf.default

# Set permissions
RUN chown -R nodejs:nodejs /usr/share/nginx/html && \
    chown -R nodejs:nodejs /var/cache/nginx && \
    chown -R nodejs:nodejs /var/log/nginx && \
    chmod -R 755 /usr/share/nginx/html

# Create pid file directory with proper permissions
RUN mkdir -p /var/run/nginx && \
    chown -R nodejs:nodejs /var/run/nginx

# Switch to non-root user
USER nodejs

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]