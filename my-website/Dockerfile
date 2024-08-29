# Use an official Node.js image as a base image
FROM node:18-buster

# Create a user for the container
RUN useradd -m -s /bin/bash myapp

# Set the user for subsequent commands
USER myapp

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the package.json and yarn.lock files to the working directory
COPY package.json yarn.lock ./

# Install the dependencies
RUN yarn install && yarn cache clean

# Copy only the necessary files for the initial build
COPY . .

# Expose the port that Docusaurus will run on
EXPOSE 3000

# Add a HEALTHCHECK instruction
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 CMD curl -f http://localhost:3000 || exit 1

# Command to run the Docusaurus development server
CMD ["yarn", "start"]
