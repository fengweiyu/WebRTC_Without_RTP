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

SET(libjingle_peerconnection_api_list
	mediaconstraintsinterface.cc
    mediastreaminterface.cc
    mediatypes.cc
    rtcerror.cc
    statstypes.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(libjingle_peerconnection_api_static STATIC ${libjingle_peerconnection_api_list})
SET_TARGET_PROPERTIES(libjingle_peerconnection_api_static PROPERTIES OUTPUT_NAME libjingle_peerconnection_api)


SET(video_frame_api_list
    video/i420_buffer.cc
    video/video_frame.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	../system_wrappers
	)
ADD_LIBRARY(video_frame_api_static STATIC ${video_frame_api_list})
SET_TARGET_PROPERTIES(video_frame_api_static PROPERTIES OUTPUT_NAME video_frame_api)


SET(audio_codecs_api_list
    audio_codecs/audio_decoder.cc
    audio_codecs/audio_format.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	)
ADD_LIBRARY(audio_codecs_api_static STATIC ${audio_codecs_api_list})
SET_TARGET_PROPERTIES(audio_codecs_api_static PROPERTIES OUTPUT_NAME audio_codecs_api)

SET(builtin_audio_decoder_factory_list
    audio_codecs/builtin_audio_decoder_factory.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	)
ADD_LIBRARY(builtin_audio_decoder_factory_static STATIC ${builtin_audio_decoder_factory_list})
SET_TARGET_PROPERTIES(builtin_audio_decoder_factory_static PROPERTIES OUTPUT_NAME builtin_audio_decoder_factory)














SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










