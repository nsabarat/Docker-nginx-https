# BASE
FROM alpine
# RUN
RUN apk add nginx; \
    mkdir /run/nginx/; \
    echo "<h1>Hello world!</h1>" > /var/www/localhost/htdocs/index.html;
# CONFIGUTATIONS
# nginx configuration
ADD $PWD/default.conf /etc/nginx/conf.d/default.conf
# keys and certs
ADD $PWD/*.key /etc/ssl/private/
ADD $PWD/*.crt /etc/ssl/certs/
WORKDIR /var/www/localhost/htdocs
# ENTRYPOINT
COPY $PWD/entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/bin/sh", "/usr/local/bin/entrypoint.sh"]
# EXPOSE PORTS
EXPOSE 80
EXPOSE 443
# RUN COMMAND
CMD ["/bin/sh", "-c", "nginx -g 'daemon off;'; nginx -s reload;"]
