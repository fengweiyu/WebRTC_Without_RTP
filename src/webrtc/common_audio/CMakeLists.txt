cmake_minimum_required (VERSION 2.8)

SET(CMAKE_TOOLCHAIN_FILE "build/ToolChain.cmake")
#SET(CMAKE_SYSTEM_NAME "Linux")
#SET(CMAKE_C_COMPILER "gcc")
#SET(CMAKE_CXX_COMPILER "g++")


add_definitions(-std=c++11)
add_definitions(-DWEBRTC_LINUX)
# -fno-rtti 禁止运行时类型信息 不加会出现某些包含纯虚函数的类 undefine reference 暂时也没搞懂原因
add_definitions(-D -fno-rtti)
project (WebRTC)
 
#SET(CMAKE_C_FLAGS "-g")
SET(CMAKE_CXX_FLAGS "-g -DWEBRTC_POSIX")

SET(common_audio_list
    audio_converter.cc
    audio_ring_buffer.cc
    audio_util.cc
    blocker.cc
    channel_buffer.cc
    fir_filter.cc
    lapped_transform.cc
    real_fourier.cc
    real_fourier_ooura.cc
    resampler/push_resampler.cc
    resampler/push_sinc_resampler.cc
    resampler/resampler.cc
    resampler/sinc_resampler.cc
    smoothing_filter.cc
    sparse_fir_filter.cc
    vad/vad.cc
    wav_file.cc
    wav_header.cc
    window_generator.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(common_audio_static STATIC ${common_audio_list})
SET_TARGET_PROPERTIES(common_audio_static PROPERTIES OUTPUT_NAME common_audio)

















SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










