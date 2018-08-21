#Create the container from alpine image
FROM node:9.11.1-alpine

#Add maintainer info (who to contact if it breaks)
MAINTAINER willwbowen@gmail.com

# Add nginx
RUN apk add --update nginx

# Create the directories needed for nginx
RUN mkdir -p /tmp/nginx/dndarchives
RUN mkdir -p /var/log/nginx
RUN mkdir -p /var/www/html

# Copy the respective nginx configuration files
COPY nginx_config/nginx.conf /etc/nginx/nginx.conf
COPY nginx_config/default.conf /etc/nginx/conf.d/default.conf

# Set the directory we want to run the next commands for
WORKDIR /tmp/nginx/dndarchives
# Copy source code
COPY . .
# Install dependencies
RUN npm install

# run webpack and the vue-loader
RUN npm run build

# copy the built app to the served directory
RUN cp -r dist/* /var/www/html

# make all files belong to the nginx user
Run chown nginx:nginx /var/www/html

#start nginx and keep the process from backgrounding and the container from quitting
CMD ["nginx", "-g", "daemon off;"]
