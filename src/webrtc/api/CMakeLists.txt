cmake_minimum_required (VERSION 2.8)

SET(CMAKE_TOOLCHAIN_FILE "build/ToolChain.cmake")
#SET(CMAKE_SYSTEM_NAME "Linux")
#SET(CMAKE_C_COMPILER "gcc")
#SET(CMAKE_CXX_COMPILER "g++")


project (WebRTC)
 
#SET(CMAKE_C_FLAGS "-g")
SET(CMAKE_CXX_FLAGS "-g")

SET(libjingle_peerconnection_api_list
	mediaconstraintsinterface.cc,
    mediastreaminterface.cc,
    mediatypes.cc,
    rtcerror.cc,
    statstypes.cc,
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	../base,
	)
ADD_LIBRARY(libjingle_peerconnection_api_static STATIC ${libjingle_peerconnection_api_list})
SET_TARGET_PROPERTIES(libjingle_peerconnection_api_static PROPERTIES OUTPUT_NAME libjingle_peerconnection_api)


SET(video_frame_api_list
    video/i420_buffer.cc,
    video/video_frame.cc,
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	../base,
	../system_wrappers,
	)
ADD_LIBRARY(video_frame_api_static STATIC ${video_frame_api_list})
SET_TARGET_PROPERTIES(video_frame_api_static PROPERTIES OUTPUT_NAME video_frame_api)







SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










