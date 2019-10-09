FROM nginx:1.14

# Install a small template engine for custom configs
ADD https://raw.githubusercontent.com/johanhaleby/bash-templater/master/templater.sh /usr/local/bin/templater
RUN chmod +x /usr/local/bin/templater

# Nginx config
ENV NGINX_CONF_PATH /etc/nginx/nginx.conf
ENV NGINX_CONF_TEMPLATE_PATH /configs/nginx.conf

ENV WORKER_PROCESSES auto

COPY configs/nginx.conf $NGINX_CONF_TEMPLATE_PATH

# App config
ENV NGINX_APP_CONF_PATH /etc/nginx/conf.d/default.conf
ENV NGINX_APP_CONF_TEMPLATE_PATH /configs/app.conf

ENV APP_ROOT /app
ENV APP_FASTCGI_PASS app:9000

COPY configs/app.conf $NGINX_APP_CONF_TEMPLATE_PATH

# Set default workdir to /app
WORKDIR /app

# Copy entrypoint.sh
COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh

# Make /usr/local/bin/entrypoint.sh executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set default entrypoint
ENTRYPOINT ["entrypoint.sh"]

# Command
CMD ["nginx", "-g", "daemon off;"]
