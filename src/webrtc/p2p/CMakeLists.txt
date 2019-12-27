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

SET(libstunprober_list
	stunprober/stunprober.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	)
ADD_LIBRARY(libstunprober_static STATIC ${libstunprober_list})
SET_TARGET_PROPERTIES(libstunprober_static PROPERTIES OUTPUT_NAME libstunprober)




SET(rtc_p2p_list
    base/asyncstuntcpsocket.cc
    base/basicpacketsocketfactory.cc
    base/dtlstransportchannel.cc
    base/jseptransport.cc
    base/p2pconstants.cc
    base/p2ptransportchannel.cc
    base/port.cc
    base/portallocator.cc
    base/pseudotcp.cc
    base/relayport.cc
    base/session.cc
    base/sessiondescription.cc
    base/stun.cc
    base/stunport.cc
    base/stunrequest.cc
    base/tcpport.cc
    base/transportcontroller.cc
    base/transportdescription.cc
    base/transportdescriptionfactory.cc
    base/turnport.cc
    base/udptransport.cc
    client/basicportallocator.cc
    client/socketmonitor.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	)
ADD_LIBRARY(rtc_p2p_static STATIC ${rtc_p2p_list})
SET_TARGET_PROPERTIES(rtc_p2p_static PROPERTIES OUTPUT_NAME rtc_p2p)














SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










