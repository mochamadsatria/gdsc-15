FROM node:16-alpine AS builder

RUN apk add --no-cache libc6-compat
WORKDIR /app

COPY . .

RUN npm install

ENTRYPOINT ["node", "server.js"]
