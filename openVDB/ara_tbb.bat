@echo off

set LIB_NAME=TBB

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
  
if exist tbb goto :skipGitTbb
echo ### get tbb from git ###
git clone --recursive https://github.com/01org/tbb.git

:skipGitTbb
cd tbb

:buildTbb
cd build
cd vs2013

echo .
echo Building %LIB_NAME%
echo .

if not exist UpgradeLog.htm Devenv makefile.sln /Upgrade >> %LOG_FILE%

Devenv makefile.sln  /build %BUILD_CONFIG% /project "tbb.vcxproj" /projectconfig "%BUILD_CONFIG%|x64" >> %LOG_FILE%

echo Building %LIB_NAME% done

:copyTbbToInstallFolder
echo Copy files to install directory

xcopy x64\%BUILD_CONFIG%\*.lib %INSTALL_DIR%\lib\*.* /s /y >> %LOG_FILE%
xcopy x64\%BUILD_CONFIG%\*.dll %INSTALL_DIR%\lib\*.* /s /y >> %LOG_FILE%

xcopy x64\%BUILD_CONFIG%\*.dll %INSTALL_DIR%\bin\*.* /s /y >> %LOG_FILE%

cd ..
cd ..

:copyIncludeDirTbb

if exist %INSTALL_DIR%\include\tbb goto :skipCopyIncludeTbb

cd include

xcopy *.* %INSTALL_DIR%\include\*.* /s /y >> %LOG_FILE%

cd ..

:skipCopyIncludeTbb

goto :doneTbb

:ERROR
echo ############################### ERROR ###############################
echo .
echo Error Occured.
echo Error Message: %OUT_MSG%
echo .
echo #####################################################################
pause
goto :doneTbb

:skipBuildTbb
echo ####################  tbb already exists.  ####################

:doneTbb

cd ..


