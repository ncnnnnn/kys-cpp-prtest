cmake_minimum_required(VERSION 3.13)
project(kys)
cmake_policy(SET CMP0081 OLD)
set(CMAKE_VERBOSE_MAKEFILE on)



# #设置模块的搜索路径
# set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")
# #找到SDL2相关库 如果未找到，则失败
# find_package(SDL2 REQUIRED)
# find_package(SDL2_image REQUIRED)
# find_package(SDL2_ttf REQUIRED)
# find_package(SDL2_mixer REQUIRED)
# find_package(SDL2_gfx REQUIRED)


add_subdirectory(src)