@echo off
set ST=%time%
set Recomposit=d:\Prototype\Recomposit

cscript %Recomposit%\decompose.vbs %CD%\CardiacActivity.accdb %CD%\SourceCardiacActivity

echo %ST%
echo %time%