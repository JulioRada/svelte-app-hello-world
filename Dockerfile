
FROM node:12 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm run build


FROM nginx:1.19
COPY --from=build /app/public /usr/share/nginx/html
