#Create the container from alpine image
FROM node:9.11.1-alpine

#Add maintainer info (who to contact if it breaks)
MAINTAINER willwbowen@gmail.com

RUN apk add --no-cache nginx

EXPOSE 8080

WORKDIR /app

COPY package*.json .
RUN npm install

COPY nginx_config/nginx.conf /etc/nginx/nginx.conf

COPY . .

RUN npm run build

CMD ["nginx"]
