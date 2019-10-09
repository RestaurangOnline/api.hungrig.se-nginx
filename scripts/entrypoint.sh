#!/bin/bash
templater "${NGINX_CONF_TEMPLATE_PATH:-}" > "${NGINX_CONF_PATH:-}"
templater "${NGINX_APP_CONF_TEMPLATE_PATH:-}" > "${NGINX_APP_CONF_PATH:-}"
exec "$@"
