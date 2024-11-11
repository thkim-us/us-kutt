FROM node:20-alpine

RUN apk add --update bash

# Setting working directory. 
WORKDIR /usr/src/app

# Installing dependencies
RUN npm install -g pnpm

# Copying source files
COPY package*.json pnpm-lock.yaml ./

# Install dependencies before building
RUN pnpm install

# Copy rest of the application
COPY . .

# Build files
RUN pnpm build

EXPOSE 3000

# Running the app
CMD [ "pnpm", "start" ]