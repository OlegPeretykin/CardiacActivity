@echo off
set ST=%time%
set Recomposit=d:\Prototype\Recomposit

cscript %Recomposit%\decompose.vbs %CD%\CardiacActivity.accdb %CD%\SourceCardiacActivity
del /Q %CD%\CardiacActivity.accdb

echo %ST%
echo %time%