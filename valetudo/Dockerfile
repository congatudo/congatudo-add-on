FROM adrigzr/valetudo-conga:homeassistant-2021.06.0

WORKDIR /usr/src/app

ENV VALETUDO_CONFIG_PATH=/config/valetudo.json

COPY valetudo.sh valetudo.sh

RUN chmod a+x valetudo.sh

CMD ["./valetudo.sh"]
