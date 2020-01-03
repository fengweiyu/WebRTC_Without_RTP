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


SET(video_coding_list
    codec_database.cc
    codec_timer.cc
    decoding_state.cc
    encoded_frame.cc
    frame_buffer.cc
    frame_buffer2.cc
    frame_object.cc
    generic_decoder.cc
    generic_encoder.cc
    h264_sprop_parameter_sets.cc
    h264_sps_pps_tracker.cc
    histogram.cc
    inter_frame_delay.cc
    jitter_buffer.cc
    jitter_estimator.cc
    media_opt_util.cc
    media_optimization.cc
    nack_module.cc
    packet.cc
    packet_buffer.cc
    protection_bitrate_calculator.cc
    qp_parser.cc
    receiver.cc
    rtp_frame_reference_finder.cc
    rtt_filter.cc
    session_info.cc
    timestamp_map.cc
    timing.cc
    video_codec_initializer.cc
    video_coding_impl.cc
    video_receiver.cc
    video_sender.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(video_coding_static STATIC ${video_coding_list})
SET_TARGET_PROPERTIES(video_coding_static PROPERTIES OUTPUT_NAME video_coding)


SET(video_coding_utility_list
    utility/default_video_bitrate_allocator.cc
    utility/frame_dropper.cc
    utility/ivf_file_writer.cc
    utility/moving_average.cc
    utility/quality_scaler.cc
    utility/vp8_header_parser.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(video_coding_utility_static STATIC ${video_coding_utility_list})
SET_TARGET_PROPERTIES(video_coding_utility_static PROPERTIES OUTPUT_NAME video_coding_utility)


SET(webrtc_h264_list
    codecs/h264/h264.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(webrtc_h264_static STATIC ${webrtc_h264_list})
SET_TARGET_PROPERTIES(webrtc_h264_static PROPERTIES OUTPUT_NAME webrtc_h264)


SET(webrtc_i420_list
    codecs/i420/i420.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(webrtc_i420_static STATIC ${webrtc_i420_list})
SET_TARGET_PROPERTIES(webrtc_i420_static PROPERTIES OUTPUT_NAME webrtc_i420)


SET(webrtc_vp8_list
    codecs/vp8/default_temporal_layers.cc
    codecs/vp8/realtime_temporal_layers.cc
    codecs/vp8/reference_picture_selection.cc
    codecs/vp8/screenshare_layers.cc
    codecs/vp8/simulcast_encoder_adapter.cc
    codecs/vp8/simulcast_rate_allocator.cc
    codecs/vp8/vp8_impl.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(webrtc_vp8_static STATIC ${webrtc_vp8_list})
SET_TARGET_PROPERTIES(webrtc_vp8_static PROPERTIES OUTPUT_NAME webrtc_vp8)


SET(webrtc_vp9_list
    codecs/vp9/screenshare_layers.cc
    codecs/vp9/vp9_frame_buffer_pool.cc
    codecs/vp9/vp9_impl.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(webrtc_vp9_static STATIC ${webrtc_vp9_list})
SET_TARGET_PROPERTIES(webrtc_vp9_static PROPERTIES OUTPUT_NAME webrtc_vp9)










SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










