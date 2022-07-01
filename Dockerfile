FROM node:latest AS builder

WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build

FROM node:alpine
COPY --from=builder /app/build ./build
RUN npm install -g serve
CMD ["serve", "build"]
