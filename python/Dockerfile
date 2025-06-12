FROM ghcr.io/astral-sh/uv:0.7-python3.13-alpine

RUN apk update

RUN apk add --no-cache libpq postgresql-dev

WORKDIR /app

COPY pyproject.toml pyproject.toml

RUN uv sync

COPY . .

ENTRYPOINT [ "/app/.venv/bin/python", "/app/main.py" ]
# ENTRYPOINT [ "/bin/sh", "/app/entrypoint.sh" ]

# CMD [ "/bin/sh" ]
