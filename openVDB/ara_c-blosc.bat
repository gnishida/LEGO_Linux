@echo off

set LIB_NAME=c-blosc

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

if exist c-blosc goto :skipGitCommand
echo ### get c-blosc from git ###
git clone --recursive https://github.com/Blosc/c-blosc.git

:skipGitCommand
cd c-blosc

if exist build goto :skipMakeBuildDir
mkdir build

:skipMakeBuildDir
cd build

echo .
echo Building %LIB_NAME%
echo .

if exist CMakeCache.txt del /f CMakeCache.txt
cmake ^
	-D BUILD_STATIC=OFF ^
	-D BUILD_TESTS=OFF ^
	-D CMAKE_INSTALL_PREFIX="%INSTALL_DIR%" ^
	-G %VISUAL_STUDIO_VERSION% ^
	.. >> %LOG_FILE%

cmake --build . >> %LOG_FILE%

:build
cmake --build . --config %BUILD_CONFIG% >> %LOG_FILE%

Devenv blosc.sln /build %BUILD_CONFIG% /project "INSTALL.vcxproj" /projectconfig "%BUILD_CONFIG%|x64" >> %LOG_FILE%

echo Building %LIB_NAME% done

echo Copy files to install directory
xcopy %INSTALL_DIR%\lib\blosc.dll %INSTALL_DIR%\bin\*.dll /s /y

echo Check if file(s) exists
if not exist %INSTALL_DIR%\bin\blosc.dll set OUT_MSG="File Missing from install folder"

goto :doneBlosc
:ERROR
echo ############################### ERROR ###############################
echo .
echo Error Occured.
echo Error Message: %OUT_MSG%
echo .
echo #####################################################################
pause

:doneBlosc

cd ..
cd ..

echo ####################  Done %LIB_NAME%  #############################
