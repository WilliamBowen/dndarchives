FROM node:9.11.1-alpine as build

RUN mkdir -p /dndarchives

WORKDIR /dndarchives

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

RUN npm run build



FROM nginx:1.13.7-alpine

COPY --from=build /dndarchives/dist/ /usr/share/nginx/html

COPY ./nginx_config/default.conf /etc/nginx/conf.d/default.conf
