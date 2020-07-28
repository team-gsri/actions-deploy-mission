FROM alpine
COPY ./entrypoint.sh /
COPY ./setup.sh /setup.sh
RUN chmod +x /entrypoint.sh && chmod +x /setup.sh && apk add openssh-client=8.3_p1-r0
ENTRYPOINT ["/entrypoint.sh"]