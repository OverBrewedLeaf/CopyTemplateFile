@echo off

set @name=test
set @ext=txt
set @directory=dir

set @target=%@name% %date:~12%%date:~4,2%%date:~7,2%.%@ext%
IF EXIST "%@directory%" (
    goto :dircheckcomplete
) ELSE (
    echo making new directory
    mkdir %@directory%
)

:dircheckcomplete
cd "%@directory%"
IF EXIST "%@target%" (
    goto EOF
) ELSE (
    cd ..
    xcopy /i "%@name%.%@ext%" "%@directory%"
    cd "%@directory%"
    ren "%@name%.%@ext%" "%@target%"
    goto EOF
)

:EOF
"%target%"
cd ..
