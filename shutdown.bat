@ECHO OFF

CHOICE /C CS /M "What is the action you want to do? (C=Cancel --- S=Set)"
IF %ERRORLEVEL% EQU 1 GOTO :Set
IF %ERRORLEVEL% EQU 2 GOTO :Cancel


:Set
SET /P delay= Enter the duration:
CHOICE /C HM /M "For Hour 'H', For Minute 'M':"

IF %ERRORLEVEL% EQU 1 GOTO :Hour
IF %ERRORLEVEL% EQU 2 GOTO :Minute


:Hour
SET /A delay *=3600
SHUTDOWN /s /t %delay%
GOTO :Exit


:Minute
SET /A delay *=60
SHUTDOWN /s /t %delay% > NUL
GOTO :ExitSet

:Cancel
SHUTDOWN /A > NUL
GOTO :ExitCancel

:ExitSet
CLS
COLOR 60
ECHO The system will be shut down within the specified time...
PING localhost -n 3 > NUL
EXIT


:ExitCancel
CLS
COLOR 2F
ECHO System shutdown aborting...
PING localhost -n 3 > NUL
EXIT