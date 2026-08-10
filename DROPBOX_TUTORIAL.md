# How To Create A Dropbox App And Get A Refresh Token

This guide explains how to create a Dropbox app and generate the credentials
used by this project:

- `DROPBOX_REFRESH_TOKEN`
- `DROPBOX_KEY`
- `DROPBOX_SECRET`

## 1. Create a Dropbox app

Open the Dropbox app console:

<https://www.dropbox.com/developers/apps>

Sign in or create a Dropbox account.

Click **Create app** and choose the app settings that match your intended
storage scope. For local development, a scoped app with app-folder access is
usually enough. Use full Dropbox access only if you understand the broader
permission impact.

After creating the app, open its settings page.

## 2. Save the app key and app secret

On the app settings page, find and save:

- App key
- App secret

Use them in `.env.sample` or your local `.env` as:

```text
DROPBOX_KEY=<APP_KEY>
DROPBOX_SECRET=<APP_SECRET>
```

Do not commit real credentials.

## 3. Generate an authorization code

Open this URL in a browser after replacing `<APP_KEY>` with your Dropbox app
key:

```text
https://www.dropbox.com/oauth2/authorize?client_id=<APP_KEY>&token_access_type=offline&response_type=code
```

Approve access for the app.

Dropbox will show an authorization code. Copy it immediately. This value is used
once to generate a refresh token.

## 4. Exchange the authorization code for a refresh token

Run this command after replacing `<APP_KEY>`, `<APP_SECRET>`, and `<APP_CODE>`:

```bash
curl --location --request POST "https://api.dropboxapi.com/oauth2/token" \
  -u "<APP_KEY>:<APP_SECRET>" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  --data-urlencode "code=<APP_CODE>" \
  --data-urlencode "grant_type=authorization_code"
```

The response should contain a `refresh_token` field.

Save it locally as:

```text
DROPBOX_REFRESH_TOKEN=<REFRESH_TOKEN>
```

## 5. Configure this project

For real Dropbox-backed attachment flows, set these values in your local
environment file:

```text
DROPBOX_REFRESH_TOKEN=<REFRESH_TOKEN>
DROPBOX_KEY=<APP_KEY>
DROPBOX_SECRET=<APP_SECRET>
```

The default `.env.sample` values are dummy values. They are enough for local
startup, but Dropbox upload, download, and delete flows require real Dropbox
credentials.
