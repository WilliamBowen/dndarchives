FROM node:9.11.1-alpine as build

RUN mkdir -p /dndarchives

WORKDIR /dndarchives

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

CMD ["npm", "start"]
