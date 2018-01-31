cmake_minimum_required(VERSION 2.8)

project(LEGO_Linux)
set (CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")

find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})

file(GLOB_RECURSE source_list "*.cpp" "*.h")
add_executable(LEGO_Linux ${source_list})

target_link_libraries(LEGO_Linux ${OpenCV_LIBS})

