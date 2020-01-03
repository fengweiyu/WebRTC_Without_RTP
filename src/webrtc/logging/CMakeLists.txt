cmake_minimum_required (VERSION 2.8)

SET(CMAKE_SYSTEM_NAME "Linux")
SET(CMAKE_C_COMPILER "gcc")
SET(CMAKE_CXX_COMPILER "g++")


project (WebRTC)
 
#SET(CMAKE_C_FLAGS "-g")
SET(CMAKE_CXX_FLAGS "-g")


SET(rtc_stats_list

	)
		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	)

ADD_LIBRARY(rtc_stats_static STATIC ${rtc_stats_list})
SET_TARGET_PROPERTIES(rtc_stats_static PROPERTIES OUTPUT_NAME rtc_stats)







SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










