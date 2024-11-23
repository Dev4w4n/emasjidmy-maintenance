# Step 1: Build the static files
FROM node:20-slim AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

# Step 2: Use Nginx for serving the static files
FROM nginx:stable-alpine
# Copy the built files to Nginx's default static file location
COPY --from=builder /app/build /usr/share/nginx/html

# Expose the default Nginx port
EXPOSE 80

