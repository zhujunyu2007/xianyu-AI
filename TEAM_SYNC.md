# Team Sync Guide

This repository should only sync source code and safe project assets.
Do not commit local account data, browser profiles, logs, database files, or secrets.

## Recommended Workflow

1. Create a private Git repository on Gitee or GitHub.
2. Push this project to the private repository.
3. Team members clone the repository.
4. Each member creates their own runtime data, account cookies, AI keys, email settings, and browser profile.

## Never Commit

- `.env` and other local secret files
- `data/`
- `browser_data/`
- `logs/`
- `trajectory_history/`
- `playwright/`
- `captcha_*.png`
- `*.db`, `*.sqlite`, `*.key`, `*.pem`

## First Run On A New Machine

```powershell
python -m venv .venv
.\.venv\Scripts\pip.exe install -r requirements.txt
.\.venv\Scripts\python.exe Start.py
```

Then open:

```text
http://127.0.0.1:8091
```

Each user should add their own account and settings in the web UI.
