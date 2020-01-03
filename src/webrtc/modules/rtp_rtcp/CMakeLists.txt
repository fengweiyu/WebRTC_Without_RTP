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


SET(rtp_rtcp_list
    source/dtmf_queue.cc
    source/flexfec_header_reader_writer.cc
    source/flexfec_receiver.cc
    source/flexfec_sender.cc
    source/forward_error_correction.cc
    source/forward_error_correction_internal.cc
    source/packet_loss_stats.cc
    source/playout_delay_oracle.cc
    source/receive_statistics_impl.cc
    source/remote_ntp_time_estimator.cc
    source/rtcp_nack_stats.cc
    source/rtcp_packet.cc
    source/rtcp_packet/app.cc
    source/rtcp_packet/bye.cc
    source/rtcp_packet/common_header.cc
    source/rtcp_packet/compound_packet.cc
    source/rtcp_packet/dlrr.cc
    source/rtcp_packet/extended_jitter_report.cc
    source/rtcp_packet/extended_reports.cc
    source/rtcp_packet/fir.cc
    source/rtcp_packet/nack.cc
    source/rtcp_packet/pli.cc
    source/rtcp_packet/psfb.cc
    source/rtcp_packet/rapid_resync_request.cc
    source/rtcp_packet/receiver_report.cc
    source/rtcp_packet/remb.cc
    source/rtcp_packet/report_block.cc
    source/rtcp_packet/rpsi.cc
    source/rtcp_packet/rrtr.cc
    source/rtcp_packet/rtpfb.cc
    source/rtcp_packet/sdes.cc
    source/rtcp_packet/sender_report.cc
    source/rtcp_packet/sli.cc
    source/rtcp_packet/target_bitrate.cc
    source/rtcp_packet/tmmb_item.cc
    source/rtcp_packet/tmmbn.cc
    source/rtcp_packet/tmmbr.cc
    source/rtcp_packet/transport_feedback.cc
    source/rtcp_packet/voip_metric.cc
    source/rtcp_receiver.cc
    source/rtcp_sender.cc
    source/rtp_format.cc
    source/rtp_format_h264.cc
    source/rtp_format_video_generic.cc
    source/rtp_format_vp8.cc
    source/rtp_format_vp9.cc
    source/rtp_header_extension.cc
    source/rtp_header_extensions.cc
    source/rtp_header_parser.cc
    source/rtp_packet.cc
    source/rtp_packet_history.cc
    source/rtp_payload_registry.cc
    source/rtp_receiver_audio.cc
    source/rtp_receiver_impl.cc
    source/rtp_receiver_strategy.cc
    source/rtp_receiver_video.cc
    source/rtp_rtcp_impl.cc
    source/rtp_sender.cc
    source/rtp_sender_audio.cc
    source/rtp_sender_video.cc
    source/rtp_utility.cc
    source/time_util.cc
    source/tmmbr_help.cc
    source/ulpfec_generator.cc
    source/ulpfec_header_reader_writer.cc
    source/ulpfec_receiver_impl.cc
    source/vp8_partition_aggregator.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(rtp_rtcp_static STATIC ${rtp_rtcp_list})
SET_TARGET_PROPERTIES(rtp_rtcp_static PROPERTIES OUTPUT_NAME rtp_rtcp)







SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










