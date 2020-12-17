FROM alpine:3.12.3
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && apk add openssh-client=8.4_p1-r2
ENTRYPOINT ["/entrypoint.sh"]
