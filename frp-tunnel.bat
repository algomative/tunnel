@echo off
REM Usage: frp-tunnel.bat dev1 3000
set SUB=%1
set PORT=%2
set SERVER=YOUR_VPS_IP
set TOKEN=YOUR_SECRET_TOKEN
set DIR=.frp-bin

if not exist "%DIR%" mkdir "%DIR%"
cd "%DIR%"
if not exist frpc.exe (
  echo Downloading frpc.exe (Windows x64)...
  bitsadmin /transfer tempDownload https://github.com/fatedier/frp/releases/download/v0.62.1/frp_0.62.1_windows_amd64.zip %CD%\frp.zip
  tar -xf frp.zip --wildcards --strip-components=1 frp_0.62.1_windows_amd64/frpc.exe
  del frp.zip
)
echo [common]> frpc.ini
echo server_addr = %SERVER%>> frpc.ini
echo server_port = 7000>> frpc.ini
echo token = %TOKEN%>> frpc.ini
echo [%SUB%]>> frpc.ini
echo type = http>> frpc.ini
echo local_port = %PORT%>> frpc.ini
echo subdomain = %SUB%>> frpc.ini
frpc.exe -c frpc.ini
