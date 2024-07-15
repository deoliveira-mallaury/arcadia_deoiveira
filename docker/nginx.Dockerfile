FROM nginx:latest
RUN apt-get update && apt-get install -y inetutils-ping
COPY build/nginx/default.conf /etc/nginx/conf.d/
RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf
RUN usermod -u 1000 www-data