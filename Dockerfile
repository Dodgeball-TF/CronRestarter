FROM alpine:latest
RUN apk add --no-cache bash
# Install kubectl
RUN apk add --no-cache curl && \
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
  apk del curl
COPY restart.sh /restart.sh
RUN chmod +x /restart.sh
CMD ["/restart.sh"]
