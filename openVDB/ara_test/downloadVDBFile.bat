@echo on

set MAIN_ROOT=%~dp0
echo %MAIN_ROOT%

if not exist icosahedron.vdb (
	if not exist icosahedron.vdb.zip (
		powershell -command "& { iwr http://www.openvdb.org/download/models/icosahedron.vdb.zip -OutFile icosahedron.vdb.zip }"
	)
)

pause
