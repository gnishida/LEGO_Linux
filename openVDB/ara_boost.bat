@echo off

set LIB_NAME=Boost

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

if exist bootstrap\bootstrap.bat goto :skipGitDownload
echo ### get boost from git ###
git clone --recursive https://github.com/boostorg/boost.git

:skipGitDownload
cd boost

if exist %INSTALL_DIR%\lib\boost_chrono-vc141-mt-gd-x64-1_67.dll goto :skipBuild

echo .
echo Building %LIB_NAME%
echo .

call bootstrap.bat >> %LOG_FILE%

b2 -j4 link=shared threading=multi toolset=msvc address-model=64 --build-dir=x64 --stage-dir=%INSTALL_DIR% --libdir=x64_lib --with-regex --with-date_time --with-thread --with-signals --with-system --with-filesystem --with-iostreams --with-program_options --with-python stage >> %LOG_FILE%

echo Building %LIB_NAME% done

:skipBuild


:copyFiles

if not exist stage\lib\boost_thread-vc141-mt-gd-x64-1_67.dll goto :ERROR

echo Copy files to install directory	
xcopy stage\lib\*.lib %INSTALL_DIR%\lib\*.lib /s /y >> %LOG_FILE%
xcopy stage\lib\*.dll %INSTALL_DIR%\lib\*.dll /s /y >> %LOG_FILE%
	
xcopy stage\lib\*.dll %INSTALL_DIR%\bin\*.dll /s /y >> %LOG_FILE%

:copyIncludeDirCppunit

if exist %INSTALL_DIR%\include\boost goto :doneBoost
xcopy boost\*.* %INSTALL_DIR%\include\boost\*.* /s /y >> %LOG_FILE%

goto :doneBoost

:ERROR
echo ############################### ERROR ###############################
echo .
echo Error Occured.
echo Error Message: %OUT_MSG%
echo .
echo #####################################################################
pause
goto :doneBoost

:doneBoost
	
cd ..

