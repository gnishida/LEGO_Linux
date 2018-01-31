cmake_minimum_required(VERSION 2.8)

project(LEGO_Linux)

find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(LEGO_Linux
	src/*.cpp
)

target_link_libraries(LEGO_Linux ${OpenCV_LIBS})

