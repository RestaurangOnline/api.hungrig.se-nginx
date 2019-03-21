FROM nginx:1.14-alpine

# Copy config
COPY docker/dev/nginx.conf /etc/nginx/conf.d/default.conf
