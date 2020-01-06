cmake_minimum_required (VERSION 2.8)

SET(CMAKE_TOOLCHAIN_FILE "build/ToolChain.cmake")
#SET(CMAKE_SYSTEM_NAME "Linux")
#SET(CMAKE_C_COMPILER "gcc")
#SET(CMAKE_CXX_COMPILER "g++")


add_definitions(-std=c++11)
add_definitions(-DWEBRTC_LINUX)
# -fno-rtti 禁止运行时类型信息 不加会出现某些包含纯虚函数的类 undefine reference 暂时也没搞懂原因
#add_definitions(-D -fno-rtti)
add_definitions(-fno-rtti)
#libsrtp需要
add_definitions(-DHAVE_NETINET_IN_H)

project (WebRTC)
 
#SET(CMAKE_C_FLAGS "-g")
SET(CMAKE_CXX_FLAGS "-g -DWEBRTC_POSIX")

SET(libjingle_peerconnection_list
    audiotrack.cc
    datachannel.cc
    dtmfsender.cc
    jsepicecandidate.cc
    jsepsessiondescription.cc
    localaudiosource.cc
    mediacontroller.cc
    mediastream.cc
    mediastreamobserver.cc
    peerconnection.cc
    peerconnectionfactory.cc
    remoteaudiosource.cc
    rtcstatscollector.cc
    rtpreceiver.cc
    rtpsender.cc
    sctputils.cc
    statscollector.cc
    trackmediainfomap.cc
    videocapturertracksource.cc
    videotrack.cc
    videotracksource.cc
    webrtcsdp.cc
    webrtcsession.cc
    webrtcsessiondescriptionfactory.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../
	${PROJECT_SOURCE_DIR}/../../
	${PROJECT_SOURCE_DIR}/../third_party/libsrtp/include
	${PROJECT_SOURCE_DIR}/../third_party/libsrtp/crypto/include	
	)
ADD_LIBRARY(libjingle_peerconnection_static STATIC ${libjingle_peerconnection_list})
SET_TARGET_PROPERTIES(libjingle_peerconnection_static PROPERTIES OUTPUT_NAME libjingle_peerconnection)




SET(rtc_pc_list
    audiomonitor.cc
    bundlefilter.cc
    channel.cc
    channelmanager.cc
    currentspeakermonitor.cc
    externalhmac.cc
    mediamonitor.cc
    mediasession.cc
    rtcpmuxfilter.cc
    srtpfilter.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	)
ADD_LIBRARY(rtc_pc_static STATIC ${rtc_pc_list})
SET_TARGET_PROPERTIES(rtc_pc_static PROPERTIES OUTPUT_NAME rtc_pc)














SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










