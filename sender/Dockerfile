FROM alpine:latest

RUN apk update

RUN apk add --no-cache libpq postgresql-dev postgresql-client

WORKDIR /app

COPY . .

ENTRYPOINT [ "/bin/sh", "/app/sender.sh" ]

# CMD [ "/bin/sh" ]
