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

SET(rtc_media_list
    engine/apm_helpers.cc
    engine/internaldecoderfactory.cc
    engine/internalencoderfactory.cc
    engine/payload_type_mapper.cc
    engine/simulcast.cc
    engine/videodecodersoftwarefallbackwrapper.cc
    engine/videoencodersoftwarefallbackwrapper.cc
    engine/webrtcmediaengine.cc
    engine/webrtcvideocapturer.cc
    engine/webrtcvideocapturerfactory.cc
    engine/webrtcvideoencoderfactory.cc
    engine/webrtcvideoengine2.cc
    engine/webrtcvoiceengine.cc
	)
		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	)

ADD_LIBRARY(rtc_media_static STATIC ${rtc_media_list})
SET_TARGET_PROPERTIES(rtc_media_static PROPERTIES OUTPUT_NAME rtc_media)


SET(rtc_media_base_list
    base/adaptedvideotracksource.cc
    base/codec.cc
    base/mediaconstants.cc
    base/mediaengine.cc
    base/rtpdataengine.cc
    base/rtputils.cc
    base/streamparams.cc
    base/turnutils.cc
    base/videoadapter.cc
    base/videobroadcaster.cc
    base/videocapturer.cc
    base/videocommon.cc
    base/videosourcebase.cc
	)
		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	${PROJECT_SOURCE_DIR}/../../
	)

ADD_LIBRARY(rtc_media_base_static STATIC ${rtc_media_base_list})
SET_TARGET_PROPERTIES(rtc_media_base_static PROPERTIES OUTPUT_NAME rtc_media_base)







SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










