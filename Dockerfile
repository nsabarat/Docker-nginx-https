FROM nginx:latest

COPY default.conf /etc/nginx/conf.d/
COPY nginx-selfsigned.crt /etc/ssl/
COPY nginx-selfsigned.key /etc/ssl
COPY sample.html /usr/share/nginx/html
