---
title: "Installation"
eyebrow: "Getting started"
lead: "Run EuroKeep on your own hardware with Docker Compose – one app container plus a MariaDB database."
description: "Install EuroKeep, the self-hosted budgeting app, with Docker Compose on your own hardware: requirements, configuration, first user and updates."
---

> **Release candidate:** The image `eurokeep/eurokeep:rc` is available on [Docker Hub](https://hub.docker.com/r/eurokeep/eurokeep). It is meant for testing, not yet for production data. Fixed versions and `latest` follow with the first release – see the [changelog](/changelog/).

EuroKeep ships as a single Docker image that contains the complete product: frontend, web server and PHP application. The only other thing it needs is a MariaDB database, which the compose file below starts for you.

```
Browser ──HTTPS──> your reverse proxy (TLS) ──HTTP:8080──> eurokeep/eurokeep ──> MariaDB
```

## Installation in five steps

1. Create an empty directory.
2. Put the [compose file](#compose-file) into it as `compose.yml`.
3. Put the [environment file](#environment-file) next to it as `.env` and fill in your values.
4. Start EuroKeep with `docker compose up -d`. The image is downloaded, database migrations run automatically and the default data is created on the first start.
5. [Create your first user](#create-the-first-user) and open `https://<your-domain>/a/`.

## Compose file

This example deploys two services: the EuroKeep application and a dedicated MariaDB instance.

```yaml
services:
  eurokeep:
    image: eurokeep/eurokeep:${EUROKEEP_VERSION:-rc}
    restart: unless-stopped
    ports:
      - "8080:8080"
    environment:
      DATABASE_URL: mysql://eurokeep:${DATABASE_USER_PW:?}@db:3306/eurokeep?encoding=utf8mb4
      SECURITY_SALT: ${SECURITY_SALT:?}
      APP_FULL_BASE_URL: ${APP_FULL_BASE_URL:?}
      ENABLE_REGISTRATION: ${ENABLE_REGISTRATION:-false}
      DEBUG: ${DEBUG:-false}
    volumes:
      - uploads:/var/www/html/uploads
      - logs:/var/www/html/logs
    depends_on:
      db:
        condition: service_healthy

  db:
    image: mariadb:11.8
    restart: unless-stopped
    environment:
      MARIADB_DATABASE: eurokeep
      MARIADB_USER: eurokeep
      MARIADB_PASSWORD: ${DATABASE_USER_PW:?}
      MARIADB_RANDOM_ROOT_PASSWORD: "1"
    volumes:
      - db:/var/lib/mysql
    healthcheck:
      test: ["CMD", "healthcheck.sh", "--connect", "--innodb_initialized"]
      interval: 10s
      retries: 10
      start_period: 30s

volumes:
  db:
  uploads:
  logs:
```

## Environment file

The `.env` file in the same directory holds the most important settings. This minimal version is enough for a working instance.

```sh
APP_FULL_BASE_URL=https://eurokeep.example.org
SECURITY_SALT=          # openssl rand -hex 32  — never change it after the first start
DATABASE_USER_PW=       # openssl rand -hex 24
EUROKEEP_VERSION=rc
ENABLE_REGISTRATION=false
DEBUG=false
```

| Variable | Description |
|---|---|
| `APP_FULL_BASE_URL` | Public address including `https://`. Required: without it the API refuses every request. |
| `SECURITY_SALT` | Random value (`openssl rand -hex 32`). **Never change it after the first start.** |
| `DATABASE_USER_PW` | Password EuroKeep uses for its MariaDB database. |
| `EUROKEEP_VERSION` | Image version. Currently `rc`. |
| `ENABLE_REGISTRATION` | Keep it `false`. Only set it to `true` while you create a user, then switch it back. |
| `DEBUG` | Never `true` in production, it exposes stack traces. |

All options – including your own database server and the Traefik drop-in – are described in the [Docker environment documentation](https://docs.eurokeep.io/configuration/Docker%20Environment/).

## HTTPS is required

Put a TLS reverse proxy (Traefik, Caddy, nginx …) in front of port 8080. Session cookies are `secure`: over plain `http://` the login reports success, but the browser drops the session right away.

## Create the first user

Management commands are CakePHP CLI commands and run inside the EuroKeep container:

```sh
docker compose exec eurokeep bin/cake user_add
```

See [user management](https://docs.eurokeep.io/manual/User%20Management/) for creating users and resetting passwords.

## Updating

1. Back up the database, e.g. `docker compose exec db mariadb-dump -u eurokeep -p eurokeep > backup.sql`
2. Raise `EUROKEEP_VERSION` in `.env`.
3. Run `docker compose pull && docker compose up -d`. Migrations run automatically on start.
