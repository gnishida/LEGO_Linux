# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /lego/bin/cmake

# The command to remove a file.
RM = /lego/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lego/LEGO_Linux

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lego/LEGO_Linux/build

# Include any dependencies generated for this target.
include CMakeFiles/LEGO_Linux.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/LEGO_Linux.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/LEGO_Linux.dir/flags.make

CMakeFiles/LEGO_Linux.dir/Building.cpp.o: CMakeFiles/LEGO_Linux.dir/flags.make
CMakeFiles/LEGO_Linux.dir/Building.cpp.o: ../Building.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lego/LEGO_Linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/LEGO_Linux.dir/Building.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LEGO_Linux.dir/Building.cpp.o -c /home/lego/LEGO_Linux/Building.cpp

CMakeFiles/LEGO_Linux.dir/Building.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LEGO_Linux.dir/Building.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lego/LEGO_Linux/Building.cpp > CMakeFiles/LEGO_Linux.dir/Building.cpp.i

CMakeFiles/LEGO_Linux.dir/Building.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LEGO_Linux.dir/Building.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lego/LEGO_Linux/Building.cpp -o CMakeFiles/LEGO_Linux.dir/Building.cpp.s

CMakeFiles/LEGO_Linux.dir/Building.cpp.o.requires:

.PHONY : CMakeFiles/LEGO_Linux.dir/Building.cpp.o.requires

CMakeFiles/LEGO_Linux.dir/Building.cpp.o.provides: CMakeFiles/LEGO_Linux.dir/Building.cpp.o.requires
	$(MAKE) -f CMakeFiles/LEGO_Linux.dir/build.make CMakeFiles/LEGO_Linux.dir/Building.cpp.o.provides.build
.PHONY : CMakeFiles/LEGO_Linux.dir/Building.cpp.o.provides

CMakeFiles/LEGO_Linux.dir/Building.cpp.o.provides.build: CMakeFiles/LEGO_Linux.dir/Building.cpp.o


CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.o: CMakeFiles/LEGO_Linux.dir/flags.make
CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.o: ../BuildingSimplification.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lego/LEGO_Linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.o -c /home/lego/LEGO_Linux/BuildingSimplification.cpp

CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lego/LEGO_Linux/BuildingSimplification.cpp > CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.i

CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lego/LEGO_Linux/BuildingSimplification.cpp -o CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.s

CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.o.requires:

.PHONY : CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.o.requires

CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.o.provides: CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.o.requires
	$(MAKE) -f CMakeFiles/LEGO_Linux.dir/build.make CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.o.provides.build
.PHONY : CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.o.provides

CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.o.provides.build: CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.o


CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.o: CMakeFiles/LEGO_Linux.dir/flags.make
CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.o: ../ContourUtils.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lego/LEGO_Linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.o -c /home/lego/LEGO_Linux/ContourUtils.cpp

CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lego/LEGO_Linux/ContourUtils.cpp > CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.i

CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lego/LEGO_Linux/ContourUtils.cpp -o CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.s

CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.o.requires:

.PHONY : CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.o.requires

CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.o.provides: CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.o.requires
	$(MAKE) -f CMakeFiles/LEGO_Linux.dir/build.make CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.o.provides.build
.PHONY : CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.o.provides

CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.o.provides.build: CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.o


CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.o: CMakeFiles/LEGO_Linux.dir/flags.make
CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.o: ../DisjointVoxelData.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lego/LEGO_Linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.o -c /home/lego/LEGO_Linux/DisjointVoxelData.cpp

CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lego/LEGO_Linux/DisjointVoxelData.cpp > CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.i

CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lego/LEGO_Linux/DisjointVoxelData.cpp -o CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.s

CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.o.requires:

.PHONY : CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.o.requires

CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.o.provides: CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.o.requires
	$(MAKE) -f CMakeFiles/LEGO_Linux.dir/build.make CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.o.provides.build
.PHONY : CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.o.provides

CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.o.provides.build: CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.o


CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.o: CMakeFiles/LEGO_Linux.dir/flags.make
CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.o: ../LayerVoxelData.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lego/LEGO_Linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.o -c /home/lego/LEGO_Linux/LayerVoxelData.cpp

CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lego/LEGO_Linux/LayerVoxelData.cpp > CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.i

CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lego/LEGO_Linux/LayerVoxelData.cpp -o CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.s

CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.o.requires:

.PHONY : CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.o.requires

CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.o.provides: CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.o.requires
	$(MAKE) -f CMakeFiles/LEGO_Linux.dir/build.make CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.o.provides.build
.PHONY : CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.o.provides

CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.o.provides.build: CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.o


CMakeFiles/LEGO_Linux.dir/main.cpp.o: CMakeFiles/LEGO_Linux.dir/flags.make
CMakeFiles/LEGO_Linux.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lego/LEGO_Linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/LEGO_Linux.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LEGO_Linux.dir/main.cpp.o -c /home/lego/LEGO_Linux/main.cpp

CMakeFiles/LEGO_Linux.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LEGO_Linux.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lego/LEGO_Linux/main.cpp > CMakeFiles/LEGO_Linux.dir/main.cpp.i

CMakeFiles/LEGO_Linux.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LEGO_Linux.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lego/LEGO_Linux/main.cpp -o CMakeFiles/LEGO_Linux.dir/main.cpp.s

CMakeFiles/LEGO_Linux.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/LEGO_Linux.dir/main.cpp.o.requires

CMakeFiles/LEGO_Linux.dir/main.cpp.o.provides: CMakeFiles/LEGO_Linux.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/LEGO_Linux.dir/build.make CMakeFiles/LEGO_Linux.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/LEGO_Linux.dir/main.cpp.o.provides

CMakeFiles/LEGO_Linux.dir/main.cpp.o.provides.build: CMakeFiles/LEGO_Linux.dir/main.cpp.o


CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.o: CMakeFiles/LEGO_Linux.dir/flags.make
CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.o: ../OpenCVSimplification.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lego/LEGO_Linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.o -c /home/lego/LEGO_Linux/OpenCVSimplification.cpp

CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lego/LEGO_Linux/OpenCVSimplification.cpp > CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.i

CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lego/LEGO_Linux/OpenCVSimplification.cpp -o CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.s

CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.o.requires:

.PHONY : CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.o.requires

CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.o.provides: CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.o.requires
	$(MAKE) -f CMakeFiles/LEGO_Linux.dir/build.make CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.o.provides.build
.PHONY : CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.o.provides

CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.o.provides.build: CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.o


CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.o: CMakeFiles/LEGO_Linux.dir/flags.make
CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.o: ../OurCustomSimplification.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lego/LEGO_Linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.o -c /home/lego/LEGO_Linux/OurCustomSimplification.cpp

CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lego/LEGO_Linux/OurCustomSimplification.cpp > CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.i

CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lego/LEGO_Linux/OurCustomSimplification.cpp -o CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.s

CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.o.requires:

.PHONY : CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.o.requires

CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.o.provides: CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.o.requires
	$(MAKE) -f CMakeFiles/LEGO_Linux.dir/build.make CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.o.provides.build
.PHONY : CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.o.provides

CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.o.provides.build: CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.o


CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.o: CMakeFiles/LEGO_Linux.dir/flags.make
CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.o: ../PlyWriter.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lego/LEGO_Linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.o -c /home/lego/LEGO_Linux/PlyWriter.cpp

CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lego/LEGO_Linux/PlyWriter.cpp > CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.i

CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lego/LEGO_Linux/PlyWriter.cpp -o CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.s

CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.o.requires:

.PHONY : CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.o.requires

CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.o.provides: CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.o.requires
	$(MAKE) -f CMakeFiles/LEGO_Linux.dir/build.make CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.o.provides.build
.PHONY : CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.o.provides

CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.o.provides.build: CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.o


# Object files for target LEGO_Linux
LEGO_Linux_OBJECTS = \
"CMakeFiles/LEGO_Linux.dir/Building.cpp.o" \
"CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.o" \
"CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.o" \
"CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.o" \
"CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.o" \
"CMakeFiles/LEGO_Linux.dir/main.cpp.o" \
"CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.o" \
"CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.o" \
"CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.o"

# External object files for target LEGO_Linux
LEGO_Linux_EXTERNAL_OBJECTS =

LEGO_Linux: CMakeFiles/LEGO_Linux.dir/Building.cpp.o
LEGO_Linux: CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.o
LEGO_Linux: CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.o
LEGO_Linux: CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.o
LEGO_Linux: CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.o
LEGO_Linux: CMakeFiles/LEGO_Linux.dir/main.cpp.o
LEGO_Linux: CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.o
LEGO_Linux: CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.o
LEGO_Linux: CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.o
LEGO_Linux: CMakeFiles/LEGO_Linux.dir/build.make
LEGO_Linux: /usr/lib/x86_64-linux-gnu/libmpfr.so
LEGO_Linux: /usr/lib/x86_64-linux-gnu/libgmp.so
LEGO_Linux: /lego/lib/libCGAL_Core.so.13.0.1
LEGO_Linux: /lego/lib/libCGAL.so.13.0.1
LEGO_Linux: /lego/lib/libboost_thread.so
LEGO_Linux: /lego/lib/libboost_system.so
LEGO_Linux: /lego/lib/libboost_chrono.so
LEGO_Linux: /lego/lib/libboost_date_time.so
LEGO_Linux: /lego/lib/libboost_atomic.so
LEGO_Linux: /lego/lib/libboost_thread.so
LEGO_Linux: /lego/lib/libboost_system.so
LEGO_Linux: /lego/lib/libboost_chrono.so
LEGO_Linux: /lego/lib/libboost_date_time.so
LEGO_Linux: /lego/lib/libboost_atomic.so
LEGO_Linux: /lego/lib/libboost_thread.so
LEGO_Linux: /lego/lib/libboost_system.so
LEGO_Linux: /lego/lib/libboost_chrono.so
LEGO_Linux: /lego/lib/libboost_date_time.so
LEGO_Linux: /lego/lib/libboost_atomic.so
LEGO_Linux: /lego/lib/libopencv_dnn.so.3.4.0
LEGO_Linux: /lego/lib/libopencv_ml.so.3.4.0
LEGO_Linux: /lego/lib/libopencv_objdetect.so.3.4.0
LEGO_Linux: /lego/lib/libopencv_shape.so.3.4.0
LEGO_Linux: /lego/lib/libopencv_stitching.so.3.4.0
LEGO_Linux: /lego/lib/libopencv_superres.so.3.4.0
LEGO_Linux: /lego/lib/libopencv_videostab.so.3.4.0
LEGO_Linux: /home/lego/Qt5.7.0/5.7/gcc_64/lib/libQt5Core.so.5.7.0
LEGO_Linux: /lego/lib/libboost_thread.so
LEGO_Linux: /lego/lib/libboost_system.so
LEGO_Linux: /lego/lib/libboost_chrono.so
LEGO_Linux: /lego/lib/libboost_date_time.so
LEGO_Linux: /lego/lib/libboost_atomic.so
LEGO_Linux: /lego/lib/libopencv_calib3d.so.3.4.0
LEGO_Linux: /lego/lib/libopencv_features2d.so.3.4.0
LEGO_Linux: /lego/lib/libopencv_flann.so.3.4.0
LEGO_Linux: /lego/lib/libopencv_highgui.so.3.4.0
LEGO_Linux: /lego/lib/libopencv_photo.so.3.4.0
LEGO_Linux: /lego/lib/libopencv_video.so.3.4.0
LEGO_Linux: /lego/lib/libopencv_videoio.so.3.4.0
LEGO_Linux: /lego/lib/libopencv_imgcodecs.so.3.4.0
LEGO_Linux: /lego/lib/libopencv_imgproc.so.3.4.0
LEGO_Linux: /lego/lib/libopencv_core.so.3.4.0
LEGO_Linux: CMakeFiles/LEGO_Linux.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lego/LEGO_Linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Linking CXX executable LEGO_Linux"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LEGO_Linux.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/LEGO_Linux.dir/build: LEGO_Linux

.PHONY : CMakeFiles/LEGO_Linux.dir/build

CMakeFiles/LEGO_Linux.dir/requires: CMakeFiles/LEGO_Linux.dir/Building.cpp.o.requires
CMakeFiles/LEGO_Linux.dir/requires: CMakeFiles/LEGO_Linux.dir/BuildingSimplification.cpp.o.requires
CMakeFiles/LEGO_Linux.dir/requires: CMakeFiles/LEGO_Linux.dir/ContourUtils.cpp.o.requires
CMakeFiles/LEGO_Linux.dir/requires: CMakeFiles/LEGO_Linux.dir/DisjointVoxelData.cpp.o.requires
CMakeFiles/LEGO_Linux.dir/requires: CMakeFiles/LEGO_Linux.dir/LayerVoxelData.cpp.o.requires
CMakeFiles/LEGO_Linux.dir/requires: CMakeFiles/LEGO_Linux.dir/main.cpp.o.requires
CMakeFiles/LEGO_Linux.dir/requires: CMakeFiles/LEGO_Linux.dir/OpenCVSimplification.cpp.o.requires
CMakeFiles/LEGO_Linux.dir/requires: CMakeFiles/LEGO_Linux.dir/OurCustomSimplification.cpp.o.requires
CMakeFiles/LEGO_Linux.dir/requires: CMakeFiles/LEGO_Linux.dir/PlyWriter.cpp.o.requires

.PHONY : CMakeFiles/LEGO_Linux.dir/requires

CMakeFiles/LEGO_Linux.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/LEGO_Linux.dir/cmake_clean.cmake
.PHONY : CMakeFiles/LEGO_Linux.dir/clean

CMakeFiles/LEGO_Linux.dir/depend:
	cd /home/lego/LEGO_Linux/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lego/LEGO_Linux /home/lego/LEGO_Linux /home/lego/LEGO_Linux/build /home/lego/LEGO_Linux/build /home/lego/LEGO_Linux/build/CMakeFiles/LEGO_Linux.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/LEGO_Linux.dir/depend

