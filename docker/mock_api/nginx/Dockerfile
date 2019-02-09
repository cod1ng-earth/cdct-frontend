
FROM nginx:1.14.2-alpine

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

COPY ./default.conf.template /default.conf.template

ENTRYPOINT [ "/entrypoint.sh" ]
