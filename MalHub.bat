@echo off >nul
chcp 65001 >nul
goto banner

:banner
echo      ███╗   ███╗ █████╗ ██╗     ██╗  ██╗██╗   ██╗██████╗ 
echo      ████╗ ████║██╔══██╗██║     ██║  ██║██║   ██║██╔══██╗
echo      ██╔████╔██║███████║██║     ███████║██║   ██║██████╔╝
echo      ██║╚██╔╝██║██╔══██║██║     ██╔══██║██║   ██║██╔══██╗
echo      ██║ ╚═╝ ██║██║  ██║███████╗██║  ██║╚██████╔╝██████╔╝
echo      ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 

color 0a
setlocal enabledelayedexpansion

:: Check if curl is installed
curl --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: curl is not installed. Please install curl to continue.
    pause
    exit /b
)

:: Define download links for each virus sample
set "worm=https://www.dropbox.com/scl/fi/mpudfen9rg69v3wtw2nya/Worm.zip?rlkey=hepqjn7wvdjryuclsdir0zf75&st=hqimza94&dl=1"
set "trojan=https://www.dropbox.com/scl/fi/rq4yx0r2o2s8fxy6ycb4x/Trojan.zip?rlkey=hk8iyls0ks9xpn2lsuwdwmc0w&st=q0smyc0l&dl=1"
set "ransomware=https://www.dropbox.com/scl/fi/ngeilep7kf7t73qfl5y0l/Ransomware.zip?rlkey=mgorwugbmmicflpwhthkzfqlx&st=ix3gua2e&dl=1"
set "unknown=https://www.dropbox.com/scl/fi/ggdv4h3ewybj6esb4ymxz/Unknown.zip?rlkey=gvhmr38p3u5uufs94bxd47q5z&st=cnh0in5t&dl=1"
set "stealer=https://www.dropbox.com/scl/fi/8zvlwftmveeg5puqjjj5l/Stealer.zip?rlkey=honi712xovczn9xdxliv60ss1&st=o1lktsvz&dl=1"
set "spy=https://www.dropbox.com/scl/fi/oqh85gdogmy4bo8ux1jz7/Spy.zip?rlkey=x9xaj7py8m2uehic9dfl02122&st=4bjdq3n2&dl=1"
set "backdoor=https://www.dropbox.com/scl/fi/baernotg36utz20cso0zz/Backdoor.zip?rlkey=gm0wvfrretme5yr8brhebw1zd&st=wkug542o&dl=1"
set "popular=https://www.dropbox.com/scl/fi/fe3ttv0z1y6gnyd28hvle/Popular.zip?rlkey=hj1dqlhdj6q1sk61jsgi0z4hf&st=9z8iaqbu&dl=1"
set "phishing=https://www.dropbox.com/scl/fi/bb53hwxh9kb2wo7opz8pd/Phishing.zip?rlkey=x8vq4pph1nrosc8xu19o4jz6l&st=1qwqlj5x&dl=1"

:: Define the download directory
set "DEST_DIR=%cd%\VirusSamples"
if not exist "%DEST_DIR%" mkdir "%DEST_DIR%"

echo. >> log.txt
echo --------------------------------------------------------------- >> log.txt
echo Starting a new download session - %date% %time% >> log.txt
echo --------------------------------------------------------------- >> log.txt

:menu
echo.
echo ---------------------------------------------------------------
echo                       Welcome to MalHub
echo             Make sure to turn off your AV (Antivirus)
echo                     Educational Purposes Only
echo ---------------------------------------------------------------
echo.
echo Please select the virus sample you want to download:
echo 1. Worms.zip 
echo 2. Trojan.zip 
echo 3. Ransomware.zip
echo 4. Unknown.zip 
echo 5. Stealer.zip 
echo 6. Spy.zip 
echo 7. Backdoor.zip
echo 8. Popular.zip 
echo 9. Phishing.zip
echo ---------------------------------------------------------------

:: Prompt for user choice
set /p choice="Enter the number of the file to download (or 'q' to quit): "

:: Exit if the user chooses 'q'
if /i "%choice%"=="q" (
    echo Exiting...
    exit /b
)

:: Set download link based on user choice
if "%choice%"=="1" (
    set "filename=Worms.zip"
    set "file_url=%worm%"
) else if "%choice%"=="2" (
    set "filename=Trojan.zip"
    set "file_url=%trojan%"
) else if "%choice%"=="3" (
    set "filename=Ransomware.zip"
    set "file_url=%ransomware%"
) else if "%choice%"=="4" (
    set "filename=Unknown.zip"
    set "file_url=%unknown%"
) else if "%choice%"=="5" (
    set "filename=Stealer.zip"
    set "file_url=%stealer%"
) else if "%choice%"=="6" (
    set "filename=Spy.zip"
    set "file_url=%spy%"
) else if "%choice%"=="7" (
    set "filename=Backdoor.zip"
    set "file_url=%backdoor%"
) else if "%choice%"=="8" (
    set "filename=Popular.zip"
    set "file_url=%popular%"
) else if "%choice%"=="9" (
    set "filename=Phishing.zip"
    set "file_url=%phishing%"
) else (
    echo Invalid selection. Please enter a valid number.
    goto menu
)

:: Confirm download
echo Are you sure you want to download %filename%? (Y/N)
set /p confirm="Enter Y to continue or N to cancel: "
if /i "%confirm%"=="N" goto menu

:: Download the file
color 0c
echo Downloading %filename%...
echo %date% %time% - Downloading %filename%... >> log.txt
curl -L -# -o "%DEST_DIR%\%filename%" "%file_url%"
if %errorlevel% neq 0 (
    echo %date% %time% - Download failed for %filename%. >> log.txt
    echo Download failed for %filename%.
    color 0a
    goto menu
)

:: Log successful download
echo %date% %time% - %filename% downloaded successfully to %DEST_DIR% >> log.txt
echo %filename% downloaded successfully to %DEST_DIR%
color 0a
goto menu

