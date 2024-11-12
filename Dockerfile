# Use the official Ubuntu image as a base
FROM ubuntu:20.04

# Set environment variables to avoid interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install necessary packages including Nginx
RUN apt-get update && apt-get install -y \
    nginx \
    && apt-get clean

# Copy the HTML file to the Nginx default web directory
COPY ./index.html /var/www/html/index.html

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
