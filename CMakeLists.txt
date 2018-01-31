cmake_minimum_required(VERSION 3.1)

project(LEGO_Linux)
set (CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")
#set (Qt5Core_DIR "~/Qt5.7.0/5.7/gcc_64")

find_package(OpenCV REQUIRED)
find_package(Qt5Core)
#find_package(CGAL REQUIRED COMPONENTS Core)

include_directories(${OpenCV_INCLUDE_DIRS})
#include(${CGAL_USE_FILE})

#file(GLOB_RECURSE source_list "*.cpp")
add_executable(LEGO_Linux
	src/Building.cpp
	src/ContourUtils.cpp
	src/main.cpp
	src/OpenCVSimplification.cpp
	src/OurCustomSimplification.cpp
)

#qt5_use_modules(LEGO_Linux Core)

target_link_libraries(LEGO_Linux ${OpenCV_LIBS} Qt5::Core)

