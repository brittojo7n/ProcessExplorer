@echo off        
:: BatchGotAdmin        
:-------------------------------------        
REM  --> Check for permissions  
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"  
REM --> If error flag set, we do not have admin.  
if '%errorlevel%' NEQ '0' (    echo Requesting administrative privileges...    goto UACPrompt) else ( goto gotAdmin )  
:UACPrompt  
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"  
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"  
    "%temp%\getadmin.vbs"  
    exit /B
:gotAdmin  
powershell iwr -uri https://raw.githubusercontent.com/brittojo7n/ProcessExplorer/master/processexplorer-install.bat -outfile processexplorer-install.bat
powershell iwr -uri https://raw.githubusercontent.com/brittojo7n/ProcessExplorer/master/wget.exe -outfile wget.exe
processexplorer-install.bat
