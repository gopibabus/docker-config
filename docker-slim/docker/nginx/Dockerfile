FROM nginx:1

RUN rm /etc/nginx/conf.d/default.conf

COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/conf.d/nginx.* /etc/nginx/conf.d/
COPY public/ /srv/app/public

WORKDIR /srv/app
