# Facio TaskManagementApp

Backend API for a team task and project management platform. The application
covers account registration, cookie-based JWT authentication, project
collaboration, task tracking, labels, comments, Dropbox-backed attachments,
email actions, and API documentation through Swagger/OpenAPI.

## Core functionality

- Authentication and account flows:
  - user registration and registration confirmation;
  - login with access/refresh JWT cookies;
  - password reset and password change;
  - email change confirmation.
- User management:
  - current-user profile lookup and update;
  - admin user listing;
  - admin role updates;
  - admin account enable/disable actions.
- Project management:
  - create, read, update, and soft-delete projects;
  - list created, assigned, and deleted projects;
  - assign employees to projects;
  - remove employees from projects;
  - invite acceptance flow.
- Task management:
  - create, read, update, and delete tasks;
  - list project tasks;
  - filter tasks by label.
- Labels and comments:
  - create, read, update, and delete personal labels;
  - attach and detach labels from assigned tasks;
  - add, update, list, and delete task comments.
- Attachments:
  - upload files to tasks;
  - read task attachments;
  - delete task attachments;
  - Dropbox integration for attachment storage.

## Technology stack

- Java 21
- Spring Boot 3.4
- Spring Web MVC
- Spring Security
- Spring Data JPA / Hibernate
- MySQL 8
- Liquibase
- Maven
- Lombok
- MapStruct
- Bean Validation
- Springdoc OpenAPI / Swagger UI
- JWT (`jjwt`)
- Resend Java SDK
- Dropbox Java SDK
- Docker / Docker Compose

## API documentation

Swagger UI is available locally at:

- <http://localhost:8082/swagger-ui/index.html>

OpenAPI JSON is available locally at:

- <http://localhost:8082/v3/api-docs>

The local environment uses dummy email, Dropbox, and JWT values by default. It is
intended for local startup, schema validation, Swagger exploration, and
non-provider development flows.

Provider-backed functionality is fully functional only when real Resend,
Dropbox, public URL, cookie, and production CORS settings are configured.

## Local startup

See [RUN_ME.md](RUN_ME.md) for the exact local Docker commands.

Short version:

```bash
docker-compose --env-file .env.sample up --build
```

Backend URL:

```text
http://localhost:8082
```

## License

This project is proprietary. Copyright and all rights are reserved by Adam
Mudrak, resident of Ukraine.

See [LICENSE.md](LICENSE.md) for permitted educational use and usage restrictions.
