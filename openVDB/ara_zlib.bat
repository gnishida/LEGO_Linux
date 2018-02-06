@echo off

set LIB_NAME=ZLib

echo #####################################################################
echo .
echo Building %LIB_NAME%
echo .
echo #####################################################################

if ""%VISUAL_STUDIO_VERSION%""=="""" set VISUAL_STUDIO_VERSION="Visual Studio 15 2017 Win64"
if "%BUILD_CONFIG%"=="" set BUILD_CONFIG=Debug
if not "%~1"=="" set BUILD_CONFIG=%1
if "%MAIN_ROOT%"=="" set MAIN_ROOT=%~dp0
if "%INSTALL_DIR%"=="" set INSTALL_DIR=%MAIN_ROOT%Install
if not exist %INSTALL_DIR% mkdir %INSTALL_DIR%
if "%LOG_DIR%"=="" set LOG_DIR=%MAIN_ROOT%Logs
if not exist %LOG_DIR% mkdir %LOG_DIR%

set LOG_FILE=%LOG_DIR%\%LIB_NAME%.log
  
if exist zlib goto :skipGitZlib
echo ### get zlib from git ###
git clone --recursive https://github.com/madler/zlib.git

:skipGitZlib
cd zlib

if exist build goto :skipMakeBuildDirZlib
mkdir build

:skipMakeBuildDirZlib
cd build

echo .
echo Building %LIB_NAME%
echo .

if exist CMakeCache.txt del /f CMakeCache.txt
cmake ^
	-D CMAKE_INSTALL_PREFIX="%INSTALL_DIR%" ^
	-G %VISUAL_STUDIO_VERSION% ^
	.. >> %LOG_FILE%

:buildZlib

cmake --build . --config %BUILD_CONFIG% >> %LOG_FILE%

Devenv zlib.sln /build %BUILD_CONFIG% /project "INSTALL.vcxproj" /projectconfig "%BUILD_CONFIG%|x64" >> %LOG_FILE%

echo Building %LIB_NAME% done

goto :doneZlib
:ERROR
echo ############################### ERROR ###############################
echo .
echo Error Occured.
echo Error Message: %OUT_MSG%
echo .
echo #####################################################################
pause

:doneZlib

cd ..
cd ..



