FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y wget unzip

RUN wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && \
    dpkg -i cloudflared-linux-amd64.deb

COPY config.yml /etc/cloudflared/config.yml
RUN echo "$CREDENTIALS_JSON" > /etc/cloudflared/credentials.json



CMD ["cloudflared", "tunnel", "--config", "/etc/cloudflared/config.yml", "run"]
