@echo off
title Run LOVE2D Project

:run
"C:\Program Files\LOVE\love.exe" project

choice /c YN /m "Retry?"

if errorlevel 2 (
    exit
) else (
    goto run
)