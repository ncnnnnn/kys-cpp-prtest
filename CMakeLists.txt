cmake_minimum_required(VERSION 3.13)
project(kys)
cmake_policy(SET CMP0081 OLD)
set(CMAKE_VERBOSE_MAKEFILE on)

include_directories(include third/installw/include)
add_subdirectory(src)