#!/usr/bin/with-contenv bashio

# Create config files based on default
# when there is no config file present
if [ ! -f "${VALETUDO_CONFIG_PATH}" ]; then
  bashio::log.info "Downloading default configuration..."
  default_config=$(curl -Ls "https://github.com/Hypfer/Valetudo/blob/2021.08.0/backend/lib/res/default_config.json?raw=true")

  bashio::log.info "Patching configuration..."
  default_config=$(echo "${default_config}" |\
    jq '
      .embedded = false |
      .robot.implementation = "CecotecCongaRobot" |
      .webserver.port = 8080
    ')

  # Add mqtt info when it is available
  if bashio::services.available "mqtt"; then
    bashio::log.info "Adding MQTT configuration..."

    host=$(bashio::services "mqtt" "host")
    port=$(bashio::services "mqtt" "port")
    username=$(bashio::services "mqtt" "username")
    password=$(bashio::services "mqtt" "password")

    default_config=$(echo "${default_config}" |\
      jq \
        --arg host "${host}" \
        --argjson port "${port}" \
        --arg username "${username}" \
        --arg password "${password}" '
          .mqtt.enabled = true |
          .mqtt.server = $host |
          .mqtt.port = $port |
          .mqtt.username = $username |
          .mqtt.password = $password
        ')
  fi

  bashio::log.info "Writing configuration to '${VALETUDO_CONFIG_PATH}'..."
  echo "${default_config}" > "${VALETUDO_CONFIG_PATH}"
else
  bashio::log.info "Using configuration from '${VALETUDO_CONFIG_PATH}'..."
fi

# Add debug env
if [ "$(bashio::config 'debug')" = "true" ]; then
  export DEBUG="agnoc:*"
else
  export DEBUG=""
fi

valetudo
