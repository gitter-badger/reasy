:: �뽫��δ��뱣�浽bat��ʽ���ļ���ִ��

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
    echo ���ϵͳû�а�װnodejs,�޷������Զ���װ���������������������������������������������������������������������� 
    goto :EXIST
)

call :IF_EXIST reasy.cmd
if %errorlevel%==1 (
    echo ���ϵͳû�а�װreasy���빤�ߣ������Զ���װ��������Ҫ�����ӡ��������������������������������������������������������������������� �������������������������������������������������������������������� 
    call npm install -g reasy --registry=https://registry.npm.taobao.org
    call npm install -g web-debug --registry=https://registry.npm.taobao.org

    call :IF_EXIST reasy.cmd || echo reasy���빤�߰�װʧ�ܡ������������������������������������������������� 
) else (
	echo ���ϵͳ�Ѿ���װ��reasy���빤�ߣ��汾Ϊ���������������������������������������������������� 
)
goto :VERSION

:VERSION
call reasy -v
goto :EXIST

:START
call :CHECK
goto :EOF

:EXIST
pause
