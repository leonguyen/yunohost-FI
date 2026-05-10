# YunoHost on Fly.io

Ready-to-deploy Fly.io repo for YunoHost.

## Requirements

- Fly.io account
- flyctl installed

## Create App

```bash
fly launch --no-deploy
```

## Create Persistent Volume

```bash
fly volumes create yunodata --size 20
```

## Deploy

```bash
fly deploy
```

## SSH Into Machine

```bash
fly ssh console
```

## Run Post Install

```bash
yunohost tools postinstall
```

## Notes

- SMTP/email hosting on Fly.io is not recommended.
- Best used for testing/self-hosting experiments.
- Use external email providers like Mailgun/Postmark/Resend.

## Recommended Machine Size

- shared-cpu-2x
- 2GB RAM minimum
- 20GB persistent volume
