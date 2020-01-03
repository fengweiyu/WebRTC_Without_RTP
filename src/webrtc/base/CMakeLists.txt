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

SET(rtc_base_approved_list
    base64.cc
    bitbuffer.cc
    bufferqueue.cc
    bytebuffer.cc
    checks.cc
    copyonwritebuffer.cc
    criticalsection.cc
    event.cc
    event_tracer.cc
    file.cc
    flags.cc
    location.cc
    md5.cc
    md5digest.cc
    optional.cc
    pathutils.cc
    platform_file.cc
    platform_thread.cc
    race_checker.cc
    random.cc
    rate_limiter.cc
    rate_statistics.cc
    ratetracker.cc
    stringencode.cc
    stringutils.cc
    thread_checker_impl.cc
    timestampaligner.cc
    timeutils.cc
	logging.cc
	)
		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	)

ADD_LIBRARY(rtc_base_approved_static STATIC ${rtc_base_approved_list})
SET_TARGET_PROPERTIES(rtc_base_approved_static PROPERTIES OUTPUT_NAME rtc_base_approved)


SET(rtc_base_list
    applefilesystem.mm
    asyncinvoker.cc
    asyncpacketsocket.cc
    asyncresolverinterface.cc
    asyncsocket.cc
    asynctcpsocket.cc
    asyncudpsocket.cc
    crc32.cc
    filerotatingstream.cc
    fileutils.cc
    helpers.cc
    ipaddress.cc
    messagedigest.cc
    messagehandler.cc
    messagequeue.cc
    nethelpers.cc
    network.cc
    networkmonitor.cc
    nullsocketserver.cc
    openssladapter.cc
    openssldigest.cc
    opensslidentity.cc
    opensslstreamadapter.cc
    physicalsocketserver.cc
    ratelimiter.cc
    rtccertificate.cc
    rtccertificategenerator.cc
    sha1.cc
    sha1digest.cc
    sharedexclusivelock.cc
    signalthread.cc
    sigslot.cc
    socketadapters.cc
    socketaddress.cc
    socketaddresspair.cc
    socketstream.cc
    ssladapter.cc
    sslfingerprint.cc
    sslidentity.cc
    sslstreamadapter.cc
    stream.cc
    thread.cc
	)
		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	)

ADD_LIBRARY(rtc_base_static STATIC ${rtc_base_list})
SET_TARGET_PROPERTIES(rtc_base_static PROPERTIES OUTPUT_NAME rtc_base)


SET(rtc_task_queue_list
    sequenced_task_checker_impl.cc
	weak_ptr.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(rtc_task_queue_static STATIC ${rtc_task_queue_list})
SET_TARGET_PROPERTIES(rtc_task_queue_static PROPERTIES OUTPUT_NAME rtc_task_queue)

SET(rtc_numerics_list
    numerics/exp_filter.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(rtc_numerics_static STATIC ${rtc_numerics_list})
SET_TARGET_PROPERTIES(rtc_numerics_static PROPERTIES OUTPUT_NAME rtc_numerics)



SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










