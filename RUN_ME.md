# Run The Application

## Important

Local `.env.sample` values are intentionally dummy values. They are enough for
the application to start locally, run migrations, and test most non-provider
flows.

The project is fully functional only when real email, Dropbox, public URL,
cookie, and production CORS settings are configured.

## Backend only: database + backend

From `task-management-app`:

```bash
docker-compose --env-file .env.sample up --build
```

Backend URL:

```text
http://localhost:8082
```

Swagger/OpenAPI URL:

```text
http://localhost:8082/swagger-ui/index.html
```

Local limitations:

- email sending uses a dummy Resend key;
- Dropbox-backed attachment upload/download/delete flows need real Dropbox
  credentials;
- public email confirmation/reset links use the local `SERVER_PATH`;
- production cookie/CORS behavior should be validated with real deployment
  settings.

## Stop all

From `task-management-app`:

```bash
docker-compose --env-file .env.sample down
```

## Stop all and delete database volume

From `task-management-app`:

```bash
docker-compose --env-file .env.sample down -v
```
