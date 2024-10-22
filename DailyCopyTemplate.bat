@echo off

set @template_path=<Path of file>
set @template_name=<File Name>
set @ext=<File Extension>
set @directory=<Target Directory>

set @date = %date:~12%%date:~4,2%%date:~7,2%
set @target=<Target Name> %@date%.%@ext%

cd %@directory%

IF EXIST ".\%@target%" (
    goto OpenFile
) ELSE (
    goto COPYFILE
)

:COPYFILE
cd ..
xcopy /i "%@template_name%" "%@directory%"
cd "%@directory%"
ren "%@template_name%" "%@target%"

:OpenFile
start "" ".\%@target%"

EXIT