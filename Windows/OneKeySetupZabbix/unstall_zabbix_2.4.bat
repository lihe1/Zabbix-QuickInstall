@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

echo "Uninstall Zabbix Agent"

net stop "Zabbix Agent"

C:\opstools\zabbix\zabbix_agentd.exe -c C:\opstools\zabbix\zabbix_agentd.win.conf -d

echo "setting powershell"
#setting powershell 
#powershell -noprofile Set-ExecutionPolicy RemoteSigned
for /f "skip=3 tokens=4" %%i in ('sc query "Zabbix Agent"') do set "zt=%%i" &goto :next
:next
if /i "%zt%"=="RUNNING" (
    echo �Ѿ�����Zabbix�÷��������С�
) else (
    echo ж�سɹ�,Zabbix����������ֹͣ״̬��
)
echo ------------------------------------------------------------------------
echo.
echo �Ѿ�������
echo. & pause
