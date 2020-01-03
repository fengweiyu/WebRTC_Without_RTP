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


SET(remote_bitrate_estimator_list
    aimd_rate_control.cc
    bwe_defines.cc
    inter_arrival.cc
    overuse_detector.cc
    overuse_estimator.cc
    remote_bitrate_estimator_abs_send_time.cc
    remote_bitrate_estimator_single_stream.cc
    remote_estimator_proxy.cc
    send_time_history.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(remote_bitrate_estimator_static STATIC ${remote_bitrate_estimator_list})
SET_TARGET_PROPERTIES(remote_bitrate_estimator_static PROPERTIES OUTPUT_NAME remote_bitrate_estimator)







SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










