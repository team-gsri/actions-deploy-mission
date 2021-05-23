FROM alpine:3.13.5
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && apk add openssh-client
ENTRYPOINT ["/entrypoint.sh"]
