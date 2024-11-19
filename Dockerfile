# Use an official Node.js runtime as a parent image
FROM node:20-slim

# Set the working directory in the container
WORKDIR /app
# Copy the rest of the application code to the container
COPY build/ /app/build

# Create a non-root user and group
RUN addgroup --system kucing && adduser --system --ingroup kucing kucing \
&& chown -R kucing:kucing /app && npm install -g serve

# Expose port 3000 (no need to be root to expose ports)
EXPOSE 3000

# Set the user to run the application
USER kucing

# Define the command to start your app
CMD ["serve", "-s", "build", "-l", "3000"]
