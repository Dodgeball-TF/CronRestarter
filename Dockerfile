FROM alpine:latest
RUN apk add --no-cache bash kubectl
COPY restart.sh /restart.sh
RUN chmod +x /restart.sh
CMD ["/restart.sh"]
