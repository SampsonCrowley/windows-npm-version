@echo off
for /f "delims=" %%i in ('npm -v') do set output=%%i
move "%NPM_PATH%" "%NPM_PATH%-%output%" >nul

SETLOCAL EnableDelayedExpansion

SET /A n=1
ECHO "ID : VERSION"
ECHO -------------------------

FOR /F "tokens=*" %%F in ('dir /on /b /a:d /p "%NPM_DIR%"') DO ( 
  ECHO !n! : %%F
  SET dir_!n!=%%F
  SET /a n=n+1   
)
set "id=1"
set /p id="enter version ID: (e.g. !dir_1! enter 1): "

for %%i in (!id!) do set target_dir=!dir_%%i!
echo !target_dir! is now your npm version
move "%NPM_DIR%\!target_dir!" "%NPM_PATH%" >nul

:end