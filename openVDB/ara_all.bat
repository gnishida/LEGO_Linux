@echo off



set VISUAL_STUDIO_VERSION="Visual Studio 15 2017 Win64"
set BUILD_CONFIG=Debug
set PYTHON_VERSION=3.6

set GLEW_FOLDER=glew-2.1.0
  
if not "%~1"=="" (
	if "%~1"=="debug" set BUILD_CONFIG=Debug
	if "%~1"=="Release" set BUILD_CONFIG=Release
	if "%~1"=="release" set BUILD_CONFIG=Release
)

set MAIN_ROOT=%~dp0
set INSTALL_DIR=%MAIN_ROOT%Install
if not exist %INSTALL_DIR% mkdir %INSTALL_DIR%

set LOG_DIR=%MAIN_ROOT%Logs

set OUT_MSG=""

echo Main Root:             %MAIN_ROOT%
echo Install Folder:        %INSTALL_DIR%
echo Visual Studio:         %VISUAL_STUDIO_VERSION%
echo Build Configuration:   %BUILD_CONFIG%
echo Python Version:        %PYTHON_VERSION%
echo Log Folder:            %LOG_DIR%

if not exist %GLEW_FOLDER% goto :ERRORNoFolder

call ara_zlib
echo ###  ara_zlib done  ###
call ara_c-blosc
echo ###  ara_c-blosc done  ###
call ara_cppunit
echo ###  ara_cppunit done  ###
call ara_openexr
echo ###  ara_openexr done  ###
call ara_tbb
echo ###  ara_tbb done  ###
call ara_boost
echo ###  ara_boost done  ###
call ara_glfw3
echo ###  ara_glfw3 done  ###
call ara_glew
echo ###  ara_glew done  ###
call ara_openvdb
echo ###  ara_openvdb done  ###

goto :doneAll
:ERRORNoFolder
echo ############################### ERROR ###############################
echo .
echo Glew folder is missing.  Download from https://sourceforge.net/projects/glew/files/glew/2.1.0/ and extract zip file into ..\Windows-Setup\openVDB\glew-2.1.0
echo .
echo #####################################################################
pause

:doneAll

echo ############################### DONE ###############################
