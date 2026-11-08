@echo off
title Grader / GradeScan - Push to GitHub
color 0B
set PATH=%LOCALAPPDATA%\git\cmd;%PATH%

echo ========================================================
echo         I-UPLOAD SA GITHUB: jme548129/Grader-app        
echo ========================================================
echo.
echo Repo Default: https://github.com/jme548129/Grader-app.git
echo.
set /p REPO_URL="Pindutin lang ang ENTER para sa Grader-app (o i-paste ang ibang URL): "

if "%REPO_URL%"=="" (
    set REPO_URL=https://github.com/jme548129/Grader-app.git
)

echo.
echo Nag-a-upload sa %REPO_URL% ...
git remote remove origin 2>nul
git remote add origin %REPO_URL%
git branch -M main
git add .
git commit -m "update: clean web app files with Supabase config" 2>nul
git push -u origin main --force

echo.
if %ERRORLEVEL% equ 0 (
    echo ========================================================
    echo   TAGUMPAY! Naka-upload na sa iyong GitHub!            
    echo ========================================================
) else (
    echo Pakisuri ang iyong GitHub permissions o credentials.
)
echo.
pause
