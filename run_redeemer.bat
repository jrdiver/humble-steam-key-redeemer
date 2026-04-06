@echo off
setlocal

if exist ".venv\Scripts\python.exe" (
	set "PYTHON_EXE=.venv\Scripts\python.exe"
) else (
	echo Creating virtual environment...
	py -3 -m venv .venv
	if errorlevel 1 goto :error
	set "PYTHON_EXE=.venv\Scripts\python.exe"
)

echo Installing dependencies...
"%PYTHON_EXE%" -m pip install -r requirements.txt
if errorlevel 1 goto :error

echo Running
"%PYTHON_EXE%" humblesteamkeysredeemer.py

:end
set /p=Press ENTER to close terminal
exit /b 0

:error
echo Failed to set up or run the redeemer.
goto :end
