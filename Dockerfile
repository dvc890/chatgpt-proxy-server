FROM geyinchi/node-chatgpt-proxy

RUN apt-get update && \
    apt-get install -y curl gpg

RUN curl https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

RUN echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ bullseye main' | tee /etc/apt/sources.list.d/cloudflare-client.list

RUN apt-get update && \
    apt-get install -y cloudflare-warp
    
EXPOSE 3000

CMD ["/bin/sh", "-c", "/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf & sleep 3 && tail -100f /var/log/node-chatgpt-proxy.log"]
