@echo off

set @name=<templatefile>
set @ext=<templatefiletype>
set @directory=<directorypath>

set @date=%date:~12%%date:~4,2%%date:~7,2%
set @target=<Target Name Here>%@date%.%@ext%

IF EXIST "%@directory%" (
    echo Dir Exists
) ELSE (
    echo making new directory
    mkdir %@directory%
)

cd "%@directory%"
IF EXIST "%@target%" (
    goto :EOF
)

:COPYFILE
cd ..
xcopy /i "%@name%.%@ext%" "%@directory%"
cd "%@directory%"
ren "%@name%.%@ext%" "%@target%"

:EOF
"%@target%"
cd ..