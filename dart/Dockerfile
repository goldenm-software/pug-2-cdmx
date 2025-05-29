FROM dart:3.8.0


WORKDIR /app

COPY . .

RUN dart pub get

ENTRYPOINT [ "/bin/bash", "/app/entrypoint.sh" ]

# CMD [ "/bin/bash" ]
