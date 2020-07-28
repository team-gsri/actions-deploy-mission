FROM alpine
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && apk add openssh-client=8.3_p1-r0
ENTRYPOINT ["/entrypoint.sh"]