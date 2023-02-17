FROM ghcr.io/congatudo/congatudo:homeassistant-2023.02.0

# Change user to root
USER root

# Change workdir
WORKDIR /usr/src/app

# Setup environment
ENV VALETUDO_CONFIG_PATH=/config/valetudo.json
    NODE_OPTIONS=--max-old-space-size=384 
    
# Copy script
COPY valetudo.sh valetudo.sh
RUN chmod a+x valetudo.sh

# Run script
CMD ["dumb-init", "./valetudo.sh"]
