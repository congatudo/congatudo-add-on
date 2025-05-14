FROM ghcr.io/congatudo/old-congatudo:homeassistant-latest

# Change user to root
USER root

# Change workdir
WORKDIR /usr/src/app

# Setup environment
ENV VALETUDO_CONFIG_PATH=/config/valetudo.json
ENV VALETUDO_HUMAN_READABLE_SYSTEM_ID=CongatudoLegacy

# Copy script
COPY valetudo.sh valetudo.sh
RUN chmod a+x valetudo.sh

# Run script
CMD ["dumb-init", "./valetudo.sh"]
