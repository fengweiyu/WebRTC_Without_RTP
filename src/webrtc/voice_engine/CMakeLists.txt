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

SET(voice_engine_list
    channel.cc
    channel_manager.cc
    channel_proxy.cc
    output_mixer.cc
    shared_data.cc
    statistics.cc
    transmit_mixer.cc
    transport_feedback_packet_loss_tracker.cc
    utility.cc
    voe_base_impl.cc
    voe_codec_impl.cc
    voe_file_impl.cc
    voe_hardware_impl.cc
    voe_neteq_stats_impl.cc
    voe_network_impl.cc
    voe_rtp_rtcp_impl.cc
    voice_engine_impl.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	)
ADD_LIBRARY(voice_engine_static STATIC ${voice_engine_list})
SET_TARGET_PROPERTIES(voice_engine_static PROPERTIES OUTPUT_NAME voice_engine)



SET(audio_level_list
    audio_level.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	)
ADD_LIBRARY(audio_level_static STATIC ${audio_level_list})
SET_TARGET_PROPERTIES(audio_level_static PROPERTIES OUTPUT_NAME audio_level)

SET(file_player_list
    file_player.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	)
ADD_LIBRARY(file_player_static STATIC ${file_player_list})
SET_TARGET_PROPERTIES(file_player_static PROPERTIES OUTPUT_NAME file_player)

SET(file_recorder_list
    file_recorder.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	)
ADD_LIBRARY(file_recorder_static STATIC ${file_recorder_list})
SET_TARGET_PROPERTIES(file_recorder_static PROPERTIES OUTPUT_NAME file_recorder)














SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










