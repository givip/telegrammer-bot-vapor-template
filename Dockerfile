FROM swift

COPY . /app
RUN apt-get update
RUN apt-get install -y openssl libssl-dev libsqlite3-dev zlib1g-dev
WORKDIR "/app"

RUN swift build

EXPOSE 8080

ENTRYPOINT ./.build/debug/telegrammer-bot-vapor-template serve -b 0.0.0.0:8080

