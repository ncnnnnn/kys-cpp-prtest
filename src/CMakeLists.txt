# project(kys)
# cmake_minimum_required(VERSION 2.6)
# cmake_policy(SET CMP0015 OLD)
if (MSVC)
    # 设置 msvc 输入代码编码格式为 utf-8
    set(CMAKE_CXX_FLAGS /source-charset:utf-8)
    add_compile_options("$<$<C_COMPILER_ID:MSVC>:/utf-8>")
    add_compile_options("$<$<CXX_COMPILER_ID:MSVC>:/utf-8>")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /wd4819  /EHsc")
    include_directories(include ../common ../local/include)
    include_directories(include ../third/installw/include)
    link_directories("../third/installw/lib")
endif()
    include_directories(include ../common ../local/include)
    include_directories(include ../third/installa/include)
    link_directories("../third/installa/lib")
if(ANDROID)
endif()
set(CMAKE_VERBOSE_MAKEFILE on)
set(CMAKE_CXX_COMPILER $ENV{CXX})
set(CMAKE_CXX_FLAGS "-O3 -std=c++14 -pthread -DNDEBUG -DUSE_SDL_MIXER_AUDIO")

# include_directories(../include . ../common ../others ../local/include)
# link_directories(. ../lib)

file(GLOB SRC_LIST
    ./*.cpp
    ./*.h
    ../common/convert.cpp
    ../common/File.cpp
    ../others/Hanz2Piny.cpp
    ../others/zip.c)
if(MSVC)
    set(LINK_LIBRARIES SDL2 SDL2_ttf SDL2_image SDL2_mixer SDL2main lua5.3 opencc sqlite3 fmtd freetype jpeg9d libpng16 zlibstatic iconv)
endif()
if(ANDROID)
    set(LINK_LIBRARIES SDL2 SDL2_ttf SDL2_image SDL2_mixer SDL2main lua5.3 opencc sqlite3 fmt freetype jpeg9d png16 z iconv dl GLESv1_CM GLESv2 OpenSLES log android hidapi)
endif()
if (APPLE)
    set(LINK_LIBRARIES ${LINK_LIBRARIES} iconv)
endif ()

add_executable(kys ${SRC_LIST})
target_link_libraries(kys ${LINK_LIBRARIES})
