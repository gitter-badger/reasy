@echo off
goto :START
exit

:IF_EXIST
SETLOCAL&PATH %PATH%;%~dp0;%cd%
if "%~$PATH:1"=="" exit /b 1
exit /b 0   

:CHECK
call :IF_EXIST node.exe
if %errorlevel%==1 (
    echo ���ϵͳû�а�װnode,�޷����б���
    pause
    exit
)

call :IF_EXIST reasy.cmd
if %errorlevel%==1 (
    echo ���ϵͳû�а�װreasy���빤�ߣ������Զ���װ ,������Ҫ������
    npm install -g reasy --registry=https://registry.npm.taobao.org
    echo reasy���빤�߰�װ�ɹ�
)
goto :EXIST


:START
call :CHECK
call reasy -v
pause

:EXIST
exit /b 0