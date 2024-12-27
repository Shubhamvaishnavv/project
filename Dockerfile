# Use official NGINX image as a base image
FROM nginx:alpine

# Copy index.html to the default NGINX HTML location
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
