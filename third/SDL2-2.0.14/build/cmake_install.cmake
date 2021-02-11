# Install script for directory: Y:/kys-cpp/third/SDL2-2.0.14

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "../installw")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/Debug/SDL2-staticd.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/Release/SDL2-static.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/MinSizeRel/SDL2-static.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/RelWithDebInfo/SDL2-static.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/Debug/SDL2d.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/Release/SDL2.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/MinSizeRel/SDL2.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/RelWithDebInfo/SDL2.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/Debug/SDL2d.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/Release/SDL2.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/MinSizeRel/SDL2.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/RelWithDebInfo/SDL2.dll")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/Debug/SDL2maind.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/Release/SDL2main.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/MinSizeRel/SDL2main.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/RelWithDebInfo/SDL2main.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2Targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2Targets.cmake"
         "Y:/kys-cpp/third/SDL2-2.0.14/build/CMakeFiles/Export/cmake/SDL2Targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2Targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2Targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/CMakeFiles/Export/cmake/SDL2Targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/CMakeFiles/Export/cmake/SDL2Targets-debug.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/CMakeFiles/Export/cmake/SDL2Targets-minsizerel.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/CMakeFiles/Export/cmake/SDL2Targets-relwithdebinfo.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "Y:/kys-cpp/third/SDL2-2.0.14/build/CMakeFiles/Export/cmake/SDL2Targets-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES
    "Y:/kys-cpp/third/SDL2-2.0.14/SDL2Config.cmake"
    "Y:/kys-cpp/third/SDL2-2.0.14/build/SDL2ConfigVersion.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SDL2" TYPE FILE FILES
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_assert.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_atomic.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_audio.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_bits.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_blendmode.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_clipboard.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_config_android.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_config_iphoneos.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_config_macosx.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_config_minimal.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_config_os2.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_config_pandora.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_config_psp.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_config_windows.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_config_winrt.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_config_wiz.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_copying.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_cpuinfo.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_egl.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_endian.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_error.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_events.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_filesystem.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_gamecontroller.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_gesture.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_haptic.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_hints.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_joystick.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_keyboard.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_keycode.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_loadso.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_locale.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_log.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_main.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_messagebox.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_metal.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_misc.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_mouse.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_mutex.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_name.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_opengl.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_opengl_glext.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_opengles.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_opengles2.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_opengles2_gl2.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_opengles2_gl2ext.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_opengles2_gl2platform.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_opengles2_khrplatform.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_pixels.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_platform.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_power.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_quit.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_rect.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_render.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_revision.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_rwops.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_scancode.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_sensor.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_shape.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_stdinc.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_surface.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_system.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_syswm.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_test.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_test_assert.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_test_common.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_test_compare.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_test_crc32.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_test_font.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_test_fuzzer.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_test_harness.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_test_images.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_test_log.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_test_md5.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_test_memory.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_test_random.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_thread.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_timer.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_touch.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_types.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_version.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_video.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/SDL_vulkan.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/begin_code.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/include/close_code.h"
    "Y:/kys-cpp/third/SDL2-2.0.14/build/include/SDL_config.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "Y:/kys-cpp/third/SDL2-2.0.14/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
