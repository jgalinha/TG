::===============================================================
:: Script de instalação dos ficheiros do Eugénio V3 no windows
::
::===============================================================
@ECHO OFF
:: Windows version check
IF NOT "%OS%"=="Windows_NT" GOTO Syntax

:: Comando para permitir os caracteres unicode
chcp 65001
SET DIR=Eugénio

:CheckDirectory
IF EXIST "%PROGRAMFILES%\%DIR%" (
   ECHO Diretoria '%PROGRAMFILES%\%DIR%' detectada iniciando copia de ficheiros
)


GOTO Exit

:Syntax
ECHO Este ficheiro é para ser usado num SO Windows

:Exit
