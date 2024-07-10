# Use the official Node.js image as the base image
FROM node:14

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React app
RUN npm run build

# Install serve to serve the build directory
RUN npm install -g serve

# Expose the port the app will run on
EXPOSE 3000

# Command to run the app
CMD ["serve", "-s", "build", "-l", "3000"]
