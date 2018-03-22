cmake_minimum_required(VERSION 3.1)

project(LEGO_Linux)

find_package(OpenCV REQUIRED)
find_package(Qt5Core)
find_package(CGAL REQUIRED COMPONENTS Core)

include_directories(${OpenCV_INCLUDE_DIRS})
include(${CGAL_USE_FILE})

add_executable(lego-cgv-modelling
	main.cpp
	util/BuildingLayer.cpp
	util/ContourUtils.cpp
	util/DisjointVoxelData.cpp
	util/PlyWriter.cpp
	simp/BuildingSimplification.cpp
	simp/DPSimplification.cpp
	simp/RightAngleSimplification.cpp
	simp/CurveSimplification.cpp
	simp/CurveRightAngleSimplification.cpp
)

target_link_libraries(lego-cgv-modelling ${OpenCV_LIBS} Qt5::Core)

set (CMAKE_CXX_FLAGS "-std=gnu++11 ${CMAKE_CXX_FLAGS}")
