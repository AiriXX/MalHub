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


set "worm=https://www.dropbox.com/scl/fi/mpudfen9rg69v3wtw2nya/Worm.zip?rlkey=hepqjn7wvdjryuclsdir0zf75&st=hqimza94&dl=1"
set "trojan=https://www.dropbox.com/scl/fi/rq4yx0r2o2s8fxy6ycb4x/Trojan.zip?rlkey=hk8iyls0ks9xpn2lsuwdwmc0w&st=q0smyc0l&dl=1"
set "ransomware=https://www.dropbox.com/scl/fi/ngeilep7kf7t73qfl5y0l/Ransomware.zip?rlkey=mgorwugbmmicflpwhthkzfqlx&st=ix3gua2e&dl=1"
set "unknown=https://www.dropbox.com/scl/fi/ggdv4h3ewybj6esb4ymxz/Unknown.zip?rlkey=gvhmr38p3u5uufs94bxd47q5z&st=cnh0in5t&dl=0=1"


set "DEST_DIR=%cd%\VirusSamples"
if not exist "%DEST_DIR%" mkdir "%DEST_DIR%"


echo ---------------------------------------------------------------
echo                       Welcome to MalHub
echo             Make sure to turn off your AV (Antivirus)
echo                     Educational Purposes Only
echo ---------------------------------------------------------------
echo Please select the virus sample you want to download:
echo 1. Worms.zip (passwords: mysubsarethebest, infected)
echo 2. Trojan.zip (passwords: mysubsarethebest, infected)
echo 3. Ransomware.zip (passwords: mysubsarethebest, infected)
echo 4. Unknown.zip (passwords: mysubsarethebest, infected)
echo ---------------------------------------------------------------


set /p choice="Enter the number of the file to download (or 'q' to quit): "


if /i "%choice%"=="q" (
    echo Exiting...
    exit /b
)


if "%choice%"=="1" (
    echo Downloading Worms.zip...
    curl -L -o "%DEST_DIR%\Worms.zip" %worm%
    echo Worms.zip downloaded to %DEST_DIR%
) else if "%choice%"=="2" (
    echo Downloading Trojan.zip...
    curl -L -o "%DEST_DIR%\Trojan.zip" %trojan%
    echo Trojan.zip downloaded to %DEST_DIR%
) else if "%choice%"=="3" (
    echo Downloading Ransomware.zip...
    curl -L -o "%DEST_DIR%\Ransomware.zip" %ransomware%
    echo Ransomware.zip downloaded to %DEST_DIR%
) else if "%choice%"=="4" (
    echo Downloading Unknown.zip...
    curl -L -o "%DEST_DIR%\Unknown.zip" %Unknown%
    echo Unknown.zip downloaded to %DEST_DIR%
) else (
    echo Invalid selection. Exiting...
    exit /b
)

echo ---------------------------------------------------------------
echo Note: Individual files inside the zip require the following passwords:
echo - "mysubsarethebest"
echo - "infected"
echo ---------------------------------------------------------------

pause
