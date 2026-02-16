FROM node:20-slim

WORKDIR /app

# Install system dependencies required for native modules
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Copy dependency files
COPY package*.json ./

# Install ONLY production dependencies
RUN npm install --omit=dev

# Copy application source
COPY . .

# Build Strapi admin panel
RUN npm run build

ENV NODE_ENV=production

EXPOSE 1337

# Run Strapi in production mode
CMD ["npm", "run", "start"]
