cmake_minimum_required (VERSION 2.8)

SET(CMAKE_SYSTEM_NAME "Linux")
SET(CMAKE_C_COMPILER "gcc")
SET(CMAKE_CXX_COMPILER "g++")


project (WebRTC)
 
#SET(CMAKE_C_FLAGS "-g")
SET(CMAKE_CXX_FLAGS "-g")

SET(rtc_base_approved_list
    base64.cc,
    bitbuffer.cc,
    bufferqueue.cc,
    bytebuffer.cc,
    checks.cc,
    copyonwritebuffer.cc,
    criticalsection.cc,
    event.cc,
    event_tracer.cc,
    file.cc,
    flags.cc,
    location.cc,
    md5.cc,
    md5digest.cc,
    optional.cc,
    pathutils.cc,
    platform_file.cc,
    platform_thread.cc,
    race_checker.cc,
    random.cc,
    rate_limiter.cc,
    rate_statistics.cc,
    ratetracker.cc,
    stringencode.cc,
    stringutils.cc,
    thread_checker_impl.cc,
    timestampaligner.cc,
    timeutils.cc,
	logging.cc,
	)
		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	)

ADD_LIBRARY(rtc_base_approved_static STATIC ${SRC_LIST})
SET_TARGET_PROPERTIES(rtc_base_approved_static PROPERTIES OUTPUT_NAME rtc_base_approved)










SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










