FROM nginx:alpine

# Set working directory to /etc/nginx
WORKDIR /etc/nginx

# Copy nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 3000

# Start Nginx service
CMD ["nginx", "-g", "daemon off;"]