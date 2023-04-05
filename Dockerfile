FROM geyinchi/node-chatgpt-proxy

EXPOSE 3000

CMD ["/bin/sh", "-c", "/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf & sleep 3 && tail -100f /var/log/node-chatgpt-proxy.log"]
