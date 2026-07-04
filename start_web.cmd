@echo off
setlocal
cd /d "%~dp0"
call "venv\Scripts\activate.bat"
python -m uvicorn reply_server:app --host 127.0.0.1 --port 8090
