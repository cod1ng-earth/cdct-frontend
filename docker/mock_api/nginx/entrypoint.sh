#!/bin/sh

# envsubst '${FQDN},${TARGET_SERVICE},${HTTP_PORT},${CORS_ALLOW_DOMAINS_REGEX}' < /default.conf.template > /etc/nginx/conf.d/default.conf;

cat /default.conf.template | envsubst '${FQDN},${TARGET_SERVICE},${HTTP_PORT},${CORS_ALLOW_DOMAINS_REGEX}' > /etc/nginx/conf.d/default.conf;

nginx -g 'daemon off;'
