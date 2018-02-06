cmake_minimum_required(VERSION 3.1)

project(LEGO_Linux)

find_package(OpenCV REQUIRED)
find_package(Qt5Core)
find_package(CGAL REQUIRED COMPONENTS Core)

include_directories(${OpenCV_INCLUDE_DIRS})
include(${CGAL_USE_FILE})

add_executable(LEGO_Linux
	Building.cpp
	BuildingSimplification.cpp
	ContourUtils.cpp
	DisjointVoxelData.cpp
	LayerVoxelData.cpp
	main.cpp
	OpenCVSimplification.cpp
	OurCustomSimplification.cpp
	PlyWriter.cpp
)

target_link_libraries(LEGO_Linux ${OpenCV_LIBS} Qt5::Core)

set (CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")
