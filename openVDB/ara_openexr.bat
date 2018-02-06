@echo off

set LIB_NAME=OpenExr
set LIB_NAME2=IlmBase

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
set LOG_FILE2=%LOG_DIR%\%LIB_NAME2%.log
  
if exist openexr goto :skipGitOpenEXR
echo ### get openexr from git ###
git clone --recursive https://github.com/openexr/openexr.git

:skipGitOpenEXR
cd openexr

:: build IlmBase
cd IlmBase

if exist build goto :skipMakeBuildDir
mkdir build

:skipMakeBuildDir
cd build

echo .
echo Building %LIB_NAME2%
echo .

if exist CMakeCache.txt del /f CMakeCache.txt
cmake ^
	-D CMAKE_INSTALL_PREFIX="%INSTALL_DIR%" ^
	-G %VISUAL_STUDIO_VERSION% ^
	.. >> %LOG_FILE2%

cmake --build . --config %BUILD_CONFIG% >> %LOG_FILE2%

:: next line builds and populates the D:\projects\core3d\repositories\c3d-playground\Windows-Setup\openVDB\Install folder
Devenv ilmbase.sln /build %BUILD_CONFIG% /project "INSTALL.vcxproj" /projectconfig "%BUILD_CONFIG%|x64" >> %LOG_FILE2%

echo Building %LIB_NAME2% done
cd ..
cd ..

:skipBuildIlmBase

cd OpenEXR

if exist build goto :skipMakeBuildDirOpenEXR
mkdir build

:skipMakeBuildDirOpenEXR
cd build

echo .
echo Building %LIB_NAME%
echo .

if exist CMakeCache.txt del /f CMakeCache.txt
cmake ^
    ::-D ZLIB_ROOT="%MAIN_ROOT%zlib" ^
	-D ZLIB_INCLUDE_DIR="%INSTALL_DIR%\include" ^
	-D ZLIB_LIBRARY_DEBUG="%INSTALL_DIR%\lib\zlibd.lib" ^
	-D ZLIB_LIBRARY_RELEASE="%INSTALL_DIR\lib\zlib.lib" ^
    -D ILMBASE_PACKAGE_PREFIX="%INSTALL_DIR%" ^
	-D CMAKE_INSTALL_PREFIX="%INSTALL_DIR%" ^
	-G %VISUAL_STUDIO_VERSION% ^
	.. >> %LOG_FILE%

	
:buildOpenEXR

cmake --build . --config %BUILD_CONFIG% >> %LOG_FILE%

Devenv openexr.sln /build %BUILD_CONFIG% /project "INSTALL.vcxproj" /projectconfig "%BUILD_CONFIG%|x64" >> %LOG_FILE%

echo Building %LIB_NAME% done

echo Copy files to install directory

xcopy %INSTALL_DIR%\lib\Half.dll %INSTALL_DIR%\bin\*.dll /s /y
xcopy %INSTALL_DIR%\lib\Iex-2_2.dll %INSTALL_DIR%\bin\*.dll /s /y
xcopy %INSTALL_DIR%\lib\IexMath-2_2.dll INSTALL_DIR%\bin\*.dll /s /y
xcopy %INSTALL_DIR%\lib\IlmThread-2_2.dll %INSTALL_DIR%\bin\*.dll /s /y
xcopy %INSTALL_DIR%\lib\Imath-2_2.dll %INSTALL_DIR%\bin\*.dll /s /y
xcopy %INSTALL_DIR%\lib\IlmImfUtil-2_2.dll %INSTALL_DIR%\bin\*.dll /s /y
xcopy %INSTALL_DIR%\lib\IlmImf-2_2.dll %INSTALL_DIR%\bin\*.dll /s /y

echo Clean up %LIB_NAME% install folder
del %INSTALL_DIR%\bin\*.exe
rd /s /q %INSTALL_DIR%\share\doc || rd /s /q %INSTALL_DIR%\share\doc

goto :doneOpenEXR
:ERROR
echo ############################### ERROR ###############################
echo .
echo Error Occured.
echo Error Message: %OUT_MSG%
echo .
echo #####################################################################
pause

:doneOpenEXR
cd ..
cd ..

cd ..



