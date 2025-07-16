FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y wget unzip

RUN wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && \
    dpkg -i cloudflared-linux-amd64.deb

COPY config.yml /etc/cloudflared/config.yml
RUN echo '{' > /etc/cloudflared/credentials.json && \
    echo '  "AccountTag": "53e15fa7bb78e28e77d01889ea8c58fa",' >> /etc/cloudflared/credentials.json && \
    echo '  "TunnelSecret": "8qlBIuR9pEr8m0C7SG4saDDj404axYhgUkOM3NPg0rc=",' >> /etc/cloudflared/credentials.json && \
    echo '  "TunnelID": "01520cf3-fd88-4da8-9286-e5bf698b81c4",' >> /etc/cloudflared/credentials.json && \
    echo '  "Endpoint": ""' >> /etc/cloudflared/credentials.json && \
    echo '}' >> /etc/cloudflared/credentials.json


CMD ["cloudflared", "tunnel", "--config", "/etc/cloudflared/config.yml", "run"]
