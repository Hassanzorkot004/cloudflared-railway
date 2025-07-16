# ✅ 1. Base légère Debian
FROM debian:stable-slim

# ✅ 2. Mise à jour + outils nécessaires
RUN apt-get update && \
    apt-get install -y wget unzip

# ✅ 3. Téléchargement et installation de cloudflared
RUN wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && \
    dpkg -i cloudflared-linux-amd64.deb

# ✅ 4. Copier les fichiers de config dans le container
COPY config.yml /etc/cloudflared/config.yml
COPY credentials.json /etc/cloudflared/credentials.json

# ✅ 5. Commande de démarrage du tunnel
CMD ["cloudflared", "tunnel", "--config", "/etc/cloudflared/config.yml", "run"]
