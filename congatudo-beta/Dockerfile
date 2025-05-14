FROM ghcr.io/congatudo/congatudo-nightly:homeassistant-latest

# Change user to root
USER root

# Change workdir
WORKDIR /usr/src/app

# Setup environment
ENV VALETUDO_CONFIG_PATH=/config/valetudo_beta.json
ENV VALETUDO_HUMAN_READABLE_SYSTEM_ID=CongatudoBeta

# Copy script
COPY valetudo.sh valetudo.sh
RUN chmod a+x valetudo.sh

# Run script
CMD ["dumb-init", "./valetudo.sh"]
