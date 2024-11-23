FROM nginx:alpine

# Set working directory to /etc/nginx
WORKDIR /etc/nginx

# Copy nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Set environment variable for redirect
ENV ROOT_REDIRECT=/web

# Configure Nginx to redirect root to /web
RUN echo "http {\n\tserver {\n\t\tlisten 80;\n\t\tlocation / {\n\t\t\treturn 301 $ROOT_REDIRECT;\n\t\t}\n\t}\n}" >> nginx.conf

# Start Nginx service
CMD ["nginx", "-g", "daemon off;"]