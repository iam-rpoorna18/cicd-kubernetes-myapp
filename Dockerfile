FROM node:18 AS builder
WORKDIR /app
COPY myapp/package*.json ./
RUN npm install
COPY myapp/. .

FROM node:18-slim
WORKDIR /app
COPY --from=builder /app .
CMD ["node", "app.js"]
