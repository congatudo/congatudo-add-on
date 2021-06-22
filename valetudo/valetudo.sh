#!/usr/bin/with-contenv bashio

if [ ! -f "/config/valetudo.json" ]; then
  bashio::log.info "Downloading default configuration..."
  default_config=$(curl -Ls "https://github.com/Hypfer/Valetudo/blob/master/backend/lib/res/default_config.json?raw=true")

  bashio::log.info "Patching configuration..."
  default_config=$(echo "${default_config}" |\
    jq '
      .embedded = false |
      .robot.implementation = "CecotecCongaRobot" |
      .webserver.port = "8080"
    ')

  if bashio::services.available "mqtt"; then
    bashio::log.info "Adding MQTT configuration..."

    host=$(bashio::services "mqtt" "host")
    port=$(bashio::services "mqtt" "port")
    username=$(bashio::services "mqtt" "username")
    password=$(bashio::services "mqtt" "password")

    default_config=$(echo "${default_config}" |\
      jq \
        --arg host "${host}" \
        --arg port "${port}" \
        --arg username "${username}" \
        --arg password "${password}" '
          .mqtt.enabled = true |
          .mqtt.server = $host |
          .mqtt.port = $port |
          .mqtt.username = $username |
          .mqtt.password = $password
        ')
  fi

  bashio::log.info "Writing configuration to '/config/valetudo.json'..."
  echo "${default_config}" > "/config/valetudo.json"
else
  bashio::log.info "Using configuration from '/config/valetudo.json'..."
fi

if [ "$(bashio::config 'debug')" = "true" ]; then
  export DEBUG="agnoc:*"
else
  export DEBUG=""
fi

valetudo