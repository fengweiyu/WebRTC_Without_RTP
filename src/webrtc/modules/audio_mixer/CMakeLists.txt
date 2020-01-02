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


SET(audio_mixer_impl_list
    audio_mixer_impl.cc
    default_output_rate_calculator.cc
    frame_combiner.cc
	)	
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(audio_mixer_impl_static STATIC ${audio_mixer_impl_list})
SET_TARGET_PROPERTIES(audio_mixer_impl_static PROPERTIES OUTPUT_NAME audio_mixer_impl)

SET(audio_frame_manipulator_list
    audio_frame_manipulator.cc
	)	
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(audio_frame_manipulator_static STATIC ${audio_frame_manipulator_list})
SET_TARGET_PROPERTIES(audio_frame_manipulator_static PROPERTIES OUTPUT_NAME audio_frame_manipulator)





SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










