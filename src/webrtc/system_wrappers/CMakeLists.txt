cmake_minimum_required (VERSION 2.8)

SET(CMAKE_SYSTEM_NAME "Linux")
SET(CMAKE_C_COMPILER "gcc")
SET(CMAKE_CXX_COMPILER "g++")


project (WebRTC)
 
#SET(CMAKE_C_FLAGS "-g")
SET(CMAKE_CXX_FLAGS "-g")

SET(system_wrappers_list
    source/aligned_malloc.cc,
    source/atomic32_win.cc,
    source/clock.cc,
    source/condition_variable_event_win.cc,
    source/cpu_features.cc,
    source/cpu_info.cc,
    source/event.cc,
    source/event_timer_posix.cc,
    source/event_timer_win.cc,
    source/file_impl.cc,
    source/logging.cc,
    source/rtp_to_ntp_estimator.cc,
    source/rw_lock.cc,
    source/rw_lock_posix.cc,
    source/rw_lock_win.cc,
    source/rw_lock_winxp_win.cc,
    source/sleep.cc,
    source/timestamp_extrapolator.cc,
    source/trace_impl.cc,
    source/trace_posix.cc,
    source/trace_win.cc,
	)
		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	../base,
	../
	)

ADD_LIBRARY(system_wrappers_static STATIC ${system_wrappers_list})
SET_TARGET_PROPERTIES(system_wrappers_static PROPERTIES OUTPUT_NAME system_wrappers)


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










