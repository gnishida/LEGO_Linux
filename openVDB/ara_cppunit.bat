@echo off

set LIB_NAME=CppUnit

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

if exist cppunit goto :skipGitCommand

mkdir cppunit
echo ### get cppunit from git ###
git clone --recursive https://anongit.freedesktop.org/git/libreoffice/cppunit.git

:skipGitCommand
cd cppunit

if "%BUILD_CONFIG%"=="Debug" (
	if exist %INSTALL_DIR%\cppunitd_dll.dll goto :skipBuildCppunit
)

if "%BUILD_CONFIG%"=="Release" (
	if exist %INSTALL_DIR%\cppunit_dll.dll goto :skipBuildCppunit
)

cd src

echo .
echo Building %LIB_NAME%
echo .

if not exist UpgradeLog.htm Devenv CppUnitLibraries2010.sln /Upgrade >> %LOG_FILE%
Devenv CppUnitLibraries2010.sln /build %BUILD_CONFIG% /project "cppunit\cppunit.vcxproj" /projectconfig "%BUILD_CONFIG%|x64" >> %LOG_FILE%
Devenv CppUnitLibraries2010.sln /build %BUILD_CONFIG% /project "cppunit\cppunit_dll.vcxproj" /projectconfig "%BUILD_CONFIG%|x64" >> %LOG_FILE%

echo Building %LIB_NAME% done

cd ..

echo Copy files to install directory

xcopy lib\*.lib %INSTALL_DIR%\lib\*.* /s
xcopy lib\*.dll %INSTALL_DIR%\lib\*.* /s

xcopy lib\*.dll %INSTALL_DIR%\bin\*.dll /s


:copyIncludeDirCppunit

if exist %INSTALL_DIR%\include\cppunit goto :skipCopyIncludeCppunit
echo Copy include files to install directory
xcopy include\cppunit %INSTALL_DIR%\include\cppunit\*.* /s /y >> %LOG_FILE%

:skipCopyIncludeCppunit

goto :doneCppunit

:ERROR
echo ############################### ERROR ###############################
echo .
echo Error Occured.
echo Error Message: %OUT_MSG%
echo .
echo #####################################################################

pause
goto :doneCppunit

:skipBuildCppunit
echo ####################  cppunit already exists.  ######################

:doneCppunit

cd ..

echo ####################  Done %LIB_NAME%  #############################

