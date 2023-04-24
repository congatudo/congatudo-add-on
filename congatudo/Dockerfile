FROM ghcr.io/congatudo/congatudo:homeassistant-2023.04

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
CMD ["dumb-init", "./valetudo.sh"]
