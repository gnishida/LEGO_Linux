@echo off

set LIB_NAME=GLEW

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

set GLEW_FOLDER=glew-2.1.0
echo GLEW_FOLDER:  %GLEW_FOLDER%
  
if not exist %GLEW_FOLDER% goto :ERRORNoFolder

cd %GLEW_FOLDER%

cd build
cd vc12

:buildGlew

echo .
echo Building %LIB_NAME%
echo .

if not exist UpgradeLog.htm Devenv glew.sln /Upgrade >> %LOG_FILE%

Devenv glew.sln /build %BUILD_CONFIG% /project "glew_static.vcxproj" /projectconfig "%BUILD_CONFIG%|x64" >> %LOG_FILE%

Devenv glew.sln /build %BUILD_CONFIG% /project "glew_shared.vcxproj" /projectconfig "%BUILD_CONFIG%|x64" >> %LOG_FILE%

Devenv glew.sln /build %BUILD_CONFIG% /project "glewinfo.vcxproj" /projectconfig "%BUILD_CONFIG%|x64" >> %LOG_FILE%

echo Building %LIB_NAME% done

cd ..
cd ..

:copyOutputToInstallFolder

if "%BUILD_CONFIG%"=="Debug" (
	if not exist bin\Debug\x64\glew32d.dll goto :ERROR
)

if "%BUILD_CONFIG%"=="Release" (
	if not exist bin\Release\x64\glew32.dll goto :ERROR
)

echo Copy files to install directory

xcopy lib\%BUILD_CONFIG%\x64\*.lib %INSTALL_DIR%\lib\*.* /s /y
xcopy bin\%BUILD_CONFIG%\x64\*.dll %INSTALL_DIR%\lib\*.* /s /y

xcopy bin\%BUILD_CONFIG%\x64\*.dll %INSTALL_DIR%\bin\*.* /s /y

:copyIncludeDirGlew

xcopy include\*.* %INSTALL_DIR%\include\*.* /s /y


goto :doneGlew


:ERROR
echo ############################### ERROR ###############################
echo .
echo Error Occured.
echo Error Message: %OUT_MSG%
echo .
echo #####################################################################
pause


:ERRORNoFolder
echo ############################### ERROR ###############################
echo .
echo Glew folder is missing.  Download from https://sourceforge.net/projects/glew/files/glew/2.1.0/ and extract zip file into ..\Windows-Setup\openVDB\glew-2.1.0
echo .
echo #####################################################################

pause
:doneGlew

cd ..



