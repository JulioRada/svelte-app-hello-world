
FROM node:12 AS packages
WORKDIR /app
COPY package*.json ./
RUN npm install

FROM node:12 AS build
WORKDIR /app
COPY . .
COPY --from=packages /app/node_modules/ .
RUN npm run build

FROM nginx:1.19
COPY --from=build /app/public /usr/share/nginx/html
