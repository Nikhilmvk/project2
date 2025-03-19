FROM ubuntu:latest

# Install Nginx and Telnet
RUN apt update && apt install -y nginx telnet

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 for web traffic
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
