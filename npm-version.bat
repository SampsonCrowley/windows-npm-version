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

set /p id="enter version ID: (e.g. !dir_1! enter 1):"

set /A n=1

FOR /F "tokens=*" %%F in ('dir /on /b /a:d /p "%NPM_DIR%"') DO ( 
  if "!id!"=="!n!" (
    echo "%%F set"
    move "%NPM_DIR%\%%F" %NPM_PATH%>nul
    goto :end
  )  
  SET /a n=n+1 
)

:end