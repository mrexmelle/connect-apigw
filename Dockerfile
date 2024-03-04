FROM openresty/openresty:1.25.3.1-alpine

COPY default.conf /etc/nginx/conf.d/
COPY plugins /usr/local/openresty/lualib/plugins

EXPOSE 8083

LABEL org.opencontainers.image.source https://github.com/mrexmelle/connect-apigw