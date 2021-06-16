FROM alpine:3.14.0
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && apk add openssh-client
ENTRYPOINT ["/entrypoint.sh"]
