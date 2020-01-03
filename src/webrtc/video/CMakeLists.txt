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

SET(video_list
    call_stats.cc
    encoder_rtcp_feedback.cc
    overuse_frame_detector.cc
    payload_router.cc
    quality_threshold.cc
    receive_statistics_proxy.cc
    report_block_stats.cc
    rtp_stream_receiver.cc
    rtp_streams_synchronizer.cc
    send_delay_stats.cc
    send_statistics_proxy.cc
    stats_counter.cc
    stream_synchronization.cc
    transport_adapter.cc
    video_receive_stream.cc
    video_send_stream.cc
    video_stream_decoder.cc
    vie_encoder.cc
    vie_remb.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	)
ADD_LIBRARY(video_static STATIC ${video_list})
SET_TARGET_PROPERTIES(video_static PROPERTIES OUTPUT_NAME video)




















SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










