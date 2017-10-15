FROM php:7.1.10
RUN apt update
RUN apt install -y git
RUN mkdir -p /opt
RUN git clone https://github.com/phpredis/phpredis.git /opt/phpredis
WORKDIR /opt/phpredis
RUN phpize
RUN ./configure
RUN make
RUN make install
COPY ./redis.ini /usr/local/etc/php/conf.d/redis.ini

