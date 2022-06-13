FROM node:14.19.3-alpine AS build
WORKDIR /app
ADD ./  ./
RUN npm install npm@latest -g
RUN npm install -g @angular/cli


FROM ubuntu/apache2
COPY ./apache2.conf  /etc/apache2/apache2.conf
COPY ./000-default.conf  /etc/apache2/sites-available/000-default.conf
COPY ./front.conf  /etc/apache2/sites-available/front.conf


COPY ./   /var/www/html/
RUN   service apache2 restart
EXPOSE 80

