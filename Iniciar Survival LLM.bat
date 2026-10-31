@echo off
rem Survival LLM portable: todo (ajustes, motor Ollama, modelos, biblioteca y tus archivos)
rem se guarda en la carpeta "datos" junto a este archivo. Nada se escribe en el PC anfitrion.
setlocal
set "BASE=%~dp0"
set "BASE=%BASE:~0,-1%"

rem Primera vez: descarga la version oficial de Survival LLM y verifica su SHA-256.
if not exist "%BASE%\programa\python\pythonw.exe" (
    powershell -NoProfile -ExecutionPolicy Bypass -File "%BASE%\preparar.ps1"
    if errorlevel 1 (
        echo.
        echo No se pudo preparar Survival LLM. Revisa tu conexion a internet e intentalo de nuevo.
        pause
        exit /b 1
    )
)

set "SURVIVAL_LLM_APP_DIR=%BASE%\datos\ajustes"
set "SURVIVAL_LLM_LIBRARY=%BASE%\datos\biblioteca"
set "SURVIVAL_LLM_FILES=%BASE%\datos\mis-archivos"
rem El motor Ollama se descarga en %LOCALAPPDATA%\Survival LLM\ollama: lo redirigimos al disco.
rem (Tambien deja ahi los datos de la ventana WebView2.)
set "LOCALAPPDATA=%BASE%\datos\local"
set "OLLAMA_MODELS=%BASE%\datos\modelos"
rem Puerto propio, para no usar un Ollama que ya este instalado en el PC anfitrion.
set "OLLAMA_HOST=127.0.0.1:11435"

for %%D in (ajustes biblioteca mis-archivos local modelos) do if not exist "%BASE%\datos\%%D" mkdir "%BASE%\datos\%%D"

start "" /D "%BASE%" "%BASE%\programa\python\pythonw.exe" "%BASE%\programa\app\app\server.py"
endlocal
