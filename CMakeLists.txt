cmake_minimum_required(VERSION 2.8)

project(LEGO_Linux)
set (CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")

find_package(OpenCV REQUIRED)
find_package(Qt5Core)
include_directories(${OpenCV_INCLUDE_DIRS})

#file(GLOB_RECURSE source_list "*.cpp")
add_executable(LEGO_Linux
	src/Building.cpp
	src/ContourUtils.cpp
	src/main.cpp
	src/OpenCVSimplification.cpp
	src/OurCustomSimplification.cpp
)

target_link_libraries(LEGO_Linux ${OpenCV_LIBS})

