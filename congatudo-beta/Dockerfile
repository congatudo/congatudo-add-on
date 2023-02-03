FROM ghcr.io/freeconga/congatudo:homeassistant-2022.09.0-conga.0

# Change user to root
USER root

# Change workdir
WORKDIR /usr/src/app

# Setup environment
ENV VALETUDO_CONFIG_PATH=/config/valetudo.json

# Copy script
COPY valetudo.sh valetudo.sh
RUN chmod a+x valetudo.sh

# Run script
CMD ["/bin/bash", "-c", "set -e && ./valetudo.sh"]
