@echo off

set LIB_NAME=OpenVDB

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

if "%PYTHON_VERSION%"=="" set PYTHON_VERSION=3.6
rem echo %PYTHON_VERSION%

set CUSTOM_ROOT=%MAIN_ROOT%custom

REM middle portion of boost files e.g. boost_chrono-vc141-mt-gd-x64-1_67.dll;  middle equals vc141-mt-gd-x64-1_67
set BOOST_FILE_APPEND=vc141-mt-gd-x64-1_67
set ILMIMF_FILE=IlmImf-2_2


set BOOST_ROOT=%INSTALL_DIR%
set BLOSC_ROOT=%INSTALL_DIR%
set CPPUINT_ROOT=%INSTALL_DIR%
set GLEW_ROOT=%INSTALL_DIR%
set GLFW3_ROOT=%INSTALL_DIR%
set ILMBASE_ROOT=%INSTALL_DIR%
set OPENEXR_ROOT=%INSTALL_DIR%
set TBB_ROOT=%INSTALL_DIR%
set ZLIB_ROOT=%INSTALL_DIR%

set ZLIB_LIBRARY_FILE=zlibd.lib
if "%BUILD_CONFIG%"=="Release" (
	set ZLIB_LIBRARY_FILE=zlib.lib
)

if exist openvdb goto :skipOpenvdbGit
echo ### get openvdb from git ###
git clone https://github.com/dreamworksanimation/openvdb.git

:skipOpenvdbGit

cd openvdb

rem rename existing CMakeLists.txt
if exist CMakeLists_org.txt goto :skipRenameOfCmakeListFile
echo renaming existing cmake list files
ren CMakeLists.txt CMakeLists_org.txt

:skipRenameOfCmakeListFile

if exist openvdb\CMakeLists_org.txt goto :skipRenameOfCmakeListFile2
echo renaming existing cmake list file in openvdb folder
cd openvdb
ren CMakeLists.txt CMakeLists_org.txt
cd ..

:skipRenameOfCmakeListFile2

if exist openvdb\python\CMakeLists_org.txt goto :skipRenameOfCmakeListFile3
echo renaming existing cmake list file in openvdb\python folder
cd openvdb
cd python
ren CMakeLists.txt CMakeLists_org.txt
cd ..
cd ..

:skipRenameOfCmakeListFile3

:: copy modified cmake list files
copy %CUSTOM_ROOT%\cmakeListFiles\CMakeLists.txt CMakeLists.txt
copy %CUSTOM_ROOT%\cmakeListFiles\openvdb\CMakeLists.txt openvdb\CMakeLists.txt
copy %CUSTOM_ROOT%\cmakeListFiles\openvdb\python\CMakeLists.txt openvdb\python\CMakeLists.txt

if exist build goto :skipCreateBuildFolder
echo create build directory
mkdir build

:skipCreateBuildFolder

cd build

@echo on
if exist CMakeCache.txt del /f CMakeCache.txt
cmake ^
      -D DOXYGEN_SKIP_DOT=ON ^
	  -D Python_ADDITIONAL_VERSIONS=%PYTHON_VERSION% ^
	  -D OPENVDB_DISABLE_BOOST_IMPLICIT_LINKING=ON ^
	  -D OPENVDB_BUILD_UNITTESTS=OFF ^
	  -D OPENVDB_ENABLE_3_ABI_COMPATIBLE=OFF ^
      -D Blosc_USE_STATIC_LIBS=OFF ^
      -D USE_GLFW3=ON ^
      -D GLFW3_USE_STATIC_LIBS=OFF ^
	  -D ILMBASE_NAMESPACE_VERSIONING=OFF ^
	  -D OPENEXR_NAMESPACE_VERSIONING=OFF ^
      -D Boost_USE_STATIC_LIBS=OFF ^
	  -D BOOST_ROOT=%MAIN_ROOT%\boost ^
	  -D BOOST_INCLUDEDIR=%BOOST_ROOT%\include ^
	  -D BOOST_LIBRARYDIR=%BOOST_ROOT%\lib ^
	  -D Boost_INCLUDE_DIR=%BOOST_ROOT%\include ^
	  -D Boost_LIBRARY_DIR=%BOOST_ROOT%\lib ^
      -D Boost_INCLUDE_DIRS=%BOOST_ROOT%\include ^
	  -D Boost_IOSTREAMS_LIBRARY=boost_iostreams-%BOOST_FILE_APPEND%.lib ^
	  -D Boost_SYSTEM_LIBRARY=boost_system-%BOOST_FILE_APPEND%.lib ^
	  -D Boost_THREAD_LIBRARY=boost_thread-%BOOST_FILE_APPEND%.lib ^
	  -D Boost_CHRONO_LIBRARY=boost_chrono-%BOOST_FILE_APPEND%.lib ^
	  -D Boost_DATE_TIME_LIBRARY=boost_date_time-%BOOST_FILE_APPEND%.lib ^
	  -D Boost_PYTHON_LIBRARY=boost_python-%BOOST_FILE_APPEND%.lib ^
	  -D Boost_REGEX_LIBRARY=boost_regex-%BOOST_FILE_APPEND%.lib ^
      -D ZLIB_INCLUDE_DIR=%ZLIB_ROOT%/include ^
      -D ZLIB_LIBRARY:FILEPATH=%ZLIB_ROOT%/lib/%ZLIB_LIBRARY_FILE% ^
      -D TBB_LIBRARY_DIR=%TBB_ROOT%\lib ^
      -D TBB_LIBRARY_PATH=%TBB_ROOT%\lib ^
      -D Tbb_TBB_LIBRARY=%TBB_ROOT%\lib\tbb_debug.lib ^
	  -D TBBMALLOC_LIBRARY_PATH=%TBB_ROOT%\lib\tbbmalloc_debug.lib ^
      -D Tbb_TBBMALLOC_LIBRARY=%TBB_ROOT%\lib\tbbmalloc_debug.lib ^
	  -D CPPUNIT_LOCATION=%CPPUINT_ROOT% ^
	  -D BLOSC_blosc_LIBRARY=%BLOSC_ROOT%\lib\blosc.lib ^
	  -D GLFW3_LIBRARIES=%GLFW3_ROOT%\lib\glfw3.lib ^
	  -D Ilmbase_HALF_DLL=%ILMBASE_ROOT%\lib\Half.dll ^
	  -D Ilmbase_HALF_LIBRARY=%ILMBASE_ROOT%\lib\Half.lib ^
	  -D Openexr_ILMIMF_LIBRARY=%OPENEXR_ROOT%\lib\%ILMIMF_FILE%.lib ^
	  -D Openexr_ILMIMF_DLL=%OPENEXR_ROOT%\lib\%ILMIMF_FILE%.dll ^
	  -D GLFW3_glfw_LIBRARY=%GLFW3_ROOT%\lib\glfw3.lib ^
      -D CMAKE_INSTALL_PREFIX="%INSTALL_DIR%" ^
	  -G %VISUAL_STUDIO_VERSION% ^
      .. >> %LOG_FILE%

cd ..
cd ..

:tryBuild	  
set BOOST_CONFIG_SUPPRESS_OUTDATED_MESSAGE=ON

echo .
echo Building %LIB_NAME%
echo .

Devenv openvdb\build\OpenVDB.sln /build %BUILD_CONFIG% /project "openvdb\build\ALL_BUILD.vcxproj" /projectconfig %BUILD_CONFIG% >> %LOG_FILE%

Devenv openvdb\build\OpenVDB.sln /build %BUILD_CONFIG% /project "INSTALL.vcxproj" /projectconfig "%BUILD_CONFIG%|x64" >> %LOG_FILE%

echo Building %LIB_NAME% done

echo Copy files to install directory
xcopy %INSTALL_DIR%\bin\openvdb.dll %INSTALL_DIR%\lib\*.dll /s /y >> %LOG_FILE%

goto :skipToEnd

:skipToERROR
echo ############################### ERROR ###############################
echo .
echo Error Occured.
echo Error Message: %OUT_MSG%
echo .
echo #####################################################################
pause

:skipToEnd
echo end

