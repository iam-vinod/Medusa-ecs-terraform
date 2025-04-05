FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy only package.json and package-lock.json first for better layer caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the application port
EXPOSE 9000

# Set environment to production (optional but recommended)
ENV NODE_ENV=production

# Run the app
CMD ["node", "index.js"]
