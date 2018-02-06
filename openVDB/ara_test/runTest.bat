@echo off

set MAIN_ROOT=%~dp0
echo Main Root:  %MAIN_ROOT%

echo run vdb_print

..\Install\bin\vdb_print.exe icosahedron.vdb -l

:endOfRun
pause
