set (H264_DIR ~/h264)
#set (H264_INCLUDE_DIR /usr/local/include/h264bitstream)
#set (H264_LIB_DIR /usr/local/lib)


#find_path(H264_INCLUDE_DIR
#
#)

find_path(H264_LIB_DIR
    libh264bitstream.so
    PATHS ${H264_DIR}
    PATH_SUFFIXES lib
)

if (H264_LIB_DIR)
    set(H264_FOUND TRUE)
endif()

if (H264_FOUND)
    if (NOT h264_FIND_QUIETLY)
        message(STATUS "Found h264bitstream:")
        #message(STATUS " - Includes: ${H264_INCLUDE_DIR}")
        message(STATUS " - Libraries: ${H264_LIB_DIR}")
    endif()
    add_library(h264 INTERFACE)
    #target_include_directories(h264 INTERFACE ${H264_INCLUDE_DIR})
    set_target_properties(h264 PROPERTIES INTERFACE_LINK_DIRECTORIES ${H264_LIB_DIR})
    target_link_libraries(h264 INTERFACE libh264bitstream.so)
else()
    if (h264_FIND_REQUIRED)
        if(H264_INCLUDE_DIR)
            message(FATAL_ERROR "h264 was found but not built.  Perform an in-source build.")
        else()
            message(FATAL_ERROR "Could not find h264")
        endif()
    endif()
endif()

mark_as_advanced(H264_INCLUDE_DIR H264_LIBRARIES)
