# Stage 1
FROM alpine
WORKDIR /usr/src/app

# Install dependencies
RUN apk update && apk add git curl bash --no-cache && rm -rf /var/cache/apk/*

# Force cache invalidation
#ADD https://api.github.com/repos/adrigzr/Valetudo/git/refs/heads/feature-conga /usr/src/version.json

# Download valetudo
#RUN git clone --depth 1 https://github.com/adrigzr/Valetudo --branch feature-conga --single-branch .

# Copy config
COPY ./valetudo.json ./valetudo.json
COPY ./valetudo ./valetudo

# Exposed ports
EXPOSE 8099
EXPOSE 4010
EXPOSE 4030
EXPOSE 4050

# Run environment
ENV VALETUDO_CONFIG_PATH=./valetudo.json
CMD ["./valetudo"]
