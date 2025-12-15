@echo off
title Run LOVE2D Project

:run
"C:\Program Files\LOVE\love.exe" %~dp0

choice /c YN /m "Retry?"

if errorlevel 2 (
    exit
) else (
    goto run
)