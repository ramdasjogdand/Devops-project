# Use an official Node.js image as the base image
FROM node:14.17.0
# Set the working directory in the container
WORKDIR /app
# Copy package.json and package-lock.json to the working directory
COPY package*.json ./
# Install app dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose port 3000 (the default port for React applications)
EXPOSE 3000

# Command to run your application
CMD ["npm", "start"]
