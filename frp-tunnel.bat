@echo off
REM Usage: frp-tunnel.bat dev1 3000

set SUB=%1
set PORT=%2
set SERVER=157.230.255.83
set TOKEN=77da14c0381ee5ab3b17de3fb4d064bad6f9eb7a04e1bae55ff0b9719fbc8217
set DIR=.frp-bin

if "%SUB%"=="" (
    echo [ERROR] Subdomain argument is missing.
    echo Usage: frp-tunnel.bat dev1 3000
    exit /b 1
)

if "%PORT%"=="" (
    echo [ERROR] Port argument is missing.
    echo Usage: frp-tunnel.bat dev1 3000
    exit /b 1
)

if not exist "%DIR%" mkdir "%DIR%"
cd "%DIR%"

if not exist frpc.exe (
    echo [ERROR] frpc.exe is missing in %CD%
    echo Please download frpc manually and place it in this folder.
    exit /b 1
)

(
echo [common]
echo server_addr = %SERVER%
echo server_port = 7000
echo token = %TOKEN%

echo [%SUB%]
echo type = http
echo local_port = %PORT%
echo subdomain = %SUB%
) > frpc.ini

echo Starting tunnel for %SUB%.tunnel.algomative.com to localhost:%PORT%
frpc.exe -c frpc.ini
