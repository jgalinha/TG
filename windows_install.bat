::===============================================================
:: Script de instalação dos ficheiros do Eugénio V3 no windows
::
::===============================================================
@ECHO OFF
:: Windows version check
IF NOT "%OS%"=="Windows_NT" GOTO NotWindows
:: ### START UAC SCRIPT ###
:: https://stackoverflow.com/questions/14639743/batch-script-to-run-as-administrator
if "%2"=="firstrun" exit
cmd /c "%0" null firstrun

if "%1"=="skipuac" goto skipuacstart

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (shift & goto gotPrivileges)

setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "!batchPath!", "ELEV", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%temp%\OEgetPrivileges.vbs"
exit /B

:gotPrivileges

setlocal & pushd .

cd /d %~dp0
cmd /c "%0" skipuac firstrun
cd /d %~dp0

:skipuacstart

if "%2"=="firstrun" exit

:: ### END UAC SCRIPT ###

:: ### START OF YOUR OWN BATCH SCRIPT BELOW THIS LINE ###
:: Comando para permitir os caracteres unicode
chcp 1252
SET DIR=Eugénio
SET CONTROL=false

:CheckDirectory
IF EXIST "%PROGRAMFILES%\%DIR%" (
   SET DEST=%PROGRAMFILES%\%DIR%
   SET CONTROL=true
   GOTO Copy
) ELSE (
  GOTO NotFound
)
IF EXIST "%PROGRAMFILES(x86)%\%DIR%" (
   SET DEST=%PROGRAMFILES(x86)%\%DIR%
   SET CONTROL=true
   GOTO Copy
) ELSE (
  GOTO NotFound
)

IF %CONTROL% equ false (
   GOTO NotFound
)

:NotFound
ECHO "Pasta do Eugénio não encontrada! Instale o Eugénio e volte a tentar."
GOTO Exit

:Copy
ECHO Diretoria '%DEST%' detectada iniciando copia de ficheiros
COPY /y ".\words_dic\words.txt" "%DEST%\geral.pal"
COPY /y ".\words_dic\words_pairs.txt" "%DEST%\geral.par"
COPY /y ".\sentences_dic\sentences.txt" "%DEST%\geral.frs"
COPY /y ".\sentences_dic\sentences_pairs.txt" "%DEST%\geral.paf"
ECHO " Ficheiros copiados!"
pause
GOTO Exit

:NotWindows
ECHO Este ficheiro é para ser usado num SO Windows

:Exit
exit /b 0
