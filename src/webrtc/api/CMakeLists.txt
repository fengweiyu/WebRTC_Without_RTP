cmake_minimum_required (VERSION 2.8)

SET(CMAKE_SYSTEM_NAME "Linux")
SET(CMAKE_C_COMPILER "gcc")
SET(CMAKE_CXX_COMPILER "g++")


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
	)

ADD_LIBRARY(libjingle_peerconnection_api_static STATIC ${SRC_LIST})
SET_TARGET_PROPERTIES(libjingle_peerconnection_api_static PROPERTIES OUTPUT_NAME libjingle_peerconnection_api)










SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










