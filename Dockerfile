FROM debian:stable-slim
RUN apt-get update && \
    apt-get install -y wget unzip
RUN wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && \
    dpkg -i cloudflared-linux-amd64.deb
COPY config.yml /etc/cloudflared/config.yml

# Créer un script d'entrée
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
