FROM php:5.6.30-apache

VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]

RUN echo "[ ***** ***** ***** ] - Copying files to Image ***** ***** ***** "
COPY ./src /tmp/src

RUN apt-get update

RUN echo "[ ***** ***** ***** ] - Installing each item in new command to use cache and avoid download again ***** ***** ***** "
RUN apt-get install -y apt-utils
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN apt-get install -y libcurl4-gnutls-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y freetds-dev

RUN echo "[ ***** ***** ***** ] - Installing PHP Dependencies ***** ***** ***** "
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd
RUN docker-php-ext-install soap
RUN docker-php-ext-configure mssql --with-libdir=lib/x86_64-linux-gnu
RUN docker-php-ext-install mssql

RUN chmod +x -R /tmp/src/

EXPOSE 80
EXPOSE 9000

WORKDIR /var/www/

RUN echo "[ ***** ***** ***** ] - Begin of Actions inside Image ***** ***** ***** "
CMD /tmp/src/actions/start.sh

### docker build -t salic-web:1.0 .
### docker run -it -v $(pwd):/var/www --name salic-web___ -e APPLICATION_ENV="development" -p 80:80 salic-web:1.0 bash

####DockerCompose.yml
#version: '2'
#services:
#  man:
#    build: .
#    image: salic-web:1.0

