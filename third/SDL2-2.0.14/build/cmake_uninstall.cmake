if (NOT EXISTS "Y:/kys-cpp/third/SDL2-2.0.14/build/install_manifest.txt")
    message(FATAL_ERROR "Cannot find install manifest: \"Y:/kys-cpp/third/SDL2-2.0.14/build/install_manifest.txt\"")
endif(NOT EXISTS "Y:/kys-cpp/third/SDL2-2.0.14/build/install_manifest.txt")

file(READ "Y:/kys-cpp/third/SDL2-2.0.14/build/install_manifest.txt" files)
string(REGEX REPLACE "\n" ";" files "${files}")
foreach (file ${files})
    message(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
    execute_process(
        COMMAND D:/Android/cmake-3.19.4-win64-x64/bin/cmake.exe -E remove "$ENV{DESTDIR}${file}"
        OUTPUT_VARIABLE rm_out
        RESULT_VARIABLE rm_retval
    )
    if(NOT ${rm_retval} EQUAL 0)
        message(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
    endif (NOT ${rm_retval} EQUAL 0)
endforeach(file)

