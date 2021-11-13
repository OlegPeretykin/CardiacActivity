@echo off
set ST=%time%
set Recomposit=d:\Prototype\Recomposit
set MSACCESSEXE="C:\Program Files\Microsoft Office\root\Office16\MSACCESS.EXE"

copy /Y %CD%\CardiacActivityTemplate0.accdb.empty %CD%\CardiacActivity.accdb
cscript %Recomposit%\compose.vbs %CD%\CardiacActivity.accdb %CD%\SourceCardiacActivity
%MSACCESSEXE% %CD%\CardiacActivity.accdb /Excl /compact

echo %ST%
echo %time%