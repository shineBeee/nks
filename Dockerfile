FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y apache2
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt install software-properties-common -y
RUN add-apt-repository ppa:ondrej/php -y
RUN apt update
RUN apt-get install php7.3 php7.3-fpm php7.3-mysql php7.3-xmlrpc php7.3-xml php7.3-curl php7.3-gd php7.3-oauth -y
RUN apt-get install -y mysql-client
RUN apt-get install libapache2-mod-php7.3 -y

COPY ./Blog /var/www/html
COPY ./dir.conf /etc/apache2/mods-enabled/

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
