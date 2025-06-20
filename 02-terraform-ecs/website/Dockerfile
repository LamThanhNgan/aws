# Use Node.js 20 Alpine for a smaller and more efficient image
FROM node:20-alpine AS build
WORKDIR /app

# Copy only package.json to leverage Docker caching
COPY package.json package-lock.json ./
RUN npm install -g npm && npm i

# Use a clean, minimal runtime image
FROM node:20-alpine
WORKDIR /app

# Copy dependencies from the build stage
COPY --from=build /app/node_modules /app/node_modules

# Copy remaining source files
COPY . .

EXPOSE 8000
CMD ["npm", "start"]