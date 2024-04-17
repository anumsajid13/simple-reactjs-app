# Use an official Node.js runtime as the base image
FROM node:14-alpine AS build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the application
RUN npm run build

# Use Nginx as the base image for serving the application
FROM nginx:alpine

# Copy the built React.js application from the build stage to the Nginx server directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Command to run Nginx and serve the application
CMD ["nginx", "-g", "daemon off;"]
