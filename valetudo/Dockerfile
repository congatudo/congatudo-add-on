FROM adrigzr/valetudo-conga:armv7

COPY ./valetudo.json ./valetudo.json
EXPOSE 8099
EXPOSE 4010
EXPOSE 4030
EXPOSE 4050

ENV VALETUDO_CONFIG_PATH=./valetudo.json

CMD ["valetudo"]