::===============================================================
:: Script de instala��o dos ficheiros do Eug�nio V3 no windows
::
::===============================================================
@ECHO OFF
:: Windows version check
IF NOT "%OS%"=="Windows_NT" GOTO NotWindows

:: Comando para permitir os caracteres unicode
chcp 1252
SET DIR=Eug�nio
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
ECHO "Pasta do Eug�nio n�o encontrada! Instale o Eug�nio e volte a tentar."
GOTO Exit

:Copy
ECHO Diretoria '%DEST%' detectada iniciando copia de ficheiros
COPY /y ".\words_dic\words.txt" "%DEST%\geral.pal"
COPY /y ".\words_dic\words_pairs.txt" "%DEST%\geral.par"
COPY /y ".\sentences_dic\sentences.txt" "%DEST%\geral.frs"
COPY /y ".\sentences_dic\sentences_pairs.txt" "%DEST%\geral.paf"
ECHO " Ficheiros copiados!"
GOTO Exit

:NotWindows
ECHO Este ficheiro � para ser usado num SO Windows

:Exit
exit /b 0
