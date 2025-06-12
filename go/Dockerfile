FROM golang:1.24-alpine3.21

RUN apk update

RUN apk add --no-cache libpq postgresql-dev

WORKDIR /app

COPY . .

RUN go get

RUN go build -o main

ENTRYPOINT [ "/app/main" ]

# CMD [ "/bin/sh" ]
