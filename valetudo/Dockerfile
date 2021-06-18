FROM adrigzr/valetudo-conga:homeassistant

WORKDIR /usr/src/app

ENV VALETUDO_CONFIG_PATH=/config/valetudo.json

COPY valetudo.sh valetudo.sh

RUN chmod a+x valetudo.sh

CMD ["./valetudo.sh"]
