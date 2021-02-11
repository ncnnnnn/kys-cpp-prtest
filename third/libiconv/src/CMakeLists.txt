cmake_minimum_required(VERSION 2.8.12)

option(ICONV_USE_EXTRA_ENCODINGS "Add support for a few rarely used encodings" OFF)
set(ICONV_CONST "const")
set(HAVE_WCHAR_T 0)
set(HAVE_VISIBILITY 1)
set(USE_MBSTATE_T 0)
set(BROKEN_WCHAR_H 0)
set(EILSEQ 84)
if(WIN32)
	set(DLL_VARIABLE "__declspec (dllimport)")
endif()

file(GLOB_RECURSE SOURCE_FILES relocatable.c iconv.c localcharset.c *.h ../include/*.h)

add_library(${TARGET_NAME} ${SOURCE_FILES})
target_include_directories(${TARGET_NAME} PUBLIC "../include" ${iconv_BINARY_DIR}/include)
target_compile_definitions(${TARGET_NAME} PRIVATE LIBDIR=\".\" NO_XMALLOC=1 ICONV_CONST=const HAVE_WORKING_O_NOFOLLOW=1)
if(BUILD_SHARED_LIBS)
	target_compile_definitions(${TARGET_NAME}
		PRIVATE BUILDING_LIBICONV
		INTERFACE USING_ICONV_SHARED
		)
endif()

if(BUILD_SHARED_LIBS)
	install(TARGETS ${TARGET_NAME}
		RUNTIME DESTINATION ./
		LIBRARY DESTINATION ./)
endif()
