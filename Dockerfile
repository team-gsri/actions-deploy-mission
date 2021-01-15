FROM alpine:3.13.0
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && apk add openssh-client=8.3_p1-r1
ENTRYPOINT ["/entrypoint.sh"]
