@echo off
:: 強制指定使用 UTF-8 全域編碼
chcp 65001 >nul

title 台股即時報價監控系統 (py312 全域環境)

:: 使用最安全的英文顯示進度，100% 避開編碼衝突
echo [System] Activating py312 env...

call activate py312 2>nul
if errorlevel 1 (
    call conda activate py312 2>nul
)

echo %CONDA_DEFAULT_ENV% | findstr /i "py312" >nul
if errorlevel 1 (
    echo [System] Failed to activate py312, trying direct run.
) else (
    echo [System] Environment py312 activated successfully.
)

echo --------------------------------------------------

if exist "main.py" (
    python main.py
) else (
    echo [Error] Cannot find main.py. Please check your filename.
)

echo --------------------------------------------------
echo Program finished.
pause