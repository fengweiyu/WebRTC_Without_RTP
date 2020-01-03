cmake_minimum_required (VERSION 2.8)

SET(CMAKE_SYSTEM_NAME "Linux")
SET(CMAKE_C_COMPILER "gcc")
SET(CMAKE_CXX_COMPILER "g++")


project (WebRTC)
 
#SET(CMAKE_C_FLAGS "-g")
SET(CMAKE_CXX_FLAGS "-g")

SET(system_wrappers_list
    source/aligned_malloc.cc
    source/atomic32_win.cc
    source/clock.cc
    source/condition_variable_event_win.cc
    source/cpu_features.cc
    source/cpu_info.cc
    source/event.cc
    source/event_timer_posix.cc
    source/event_timer_win.cc
    source/file_impl.cc
    source/logging.cc
    source/rtp_to_ntp_estimator.cc
    source/rw_lock.cc
    source/rw_lock_posix.cc
    source/rw_lock_win.cc
    source/rw_lock_winxp_win.cc
    source/sleep.cc
    source/timestamp_extrapolator.cc
    source/trace_impl.cc
    source/trace_posix.cc
    source/trace_win.cc
	)
		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	../base
	../
	)

ADD_LIBRARY(system_wrappers_static STATIC ${system_wrappers_list})
SET_TARGET_PROPERTIES(system_wrappers_static PROPERTIES OUTPUT_NAME system_wrappers)


SET(libjingle_peerconnection_api_list
	mediaconstraintsinterface.cc
    mediastreaminterface.cc
    mediatypes.cc
    rtcerror.cc
    statstypes.cc
	)
		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	)

ADD_LIBRARY(libjingle_peerconnection_api_static STATIC ${libjingle_peerconnection_api_list})
SET_TARGET_PROPERTIES(libjingle_peerconnection_api_static PROPERTIES OUTPUT_NAME libjingle_peerconnection_api)


SET(field_trial_default_list
    source/field_trial_default.cc
	)
		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	)

ADD_LIBRARY(field_trial_default_static STATIC ${field_trial_default_list})
SET_TARGET_PROPERTIES(field_trial_default_static PROPERTIES OUTPUT_NAME field_trial_default)


SET(metrics_default_list
    source/metrics_default.cc
	)
		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	)

ADD_LIBRARY(metrics_default_static STATIC ${metrics_default_list})
SET_TARGET_PROPERTIES(metrics_default_static PROPERTIES OUTPUT_NAME metrics_default)






SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










