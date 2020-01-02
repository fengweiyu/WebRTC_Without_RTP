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

SET(audio_encoder_interface_list
	audio_coding/codecs/audio_encoder.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(audio_encoder_interface_static STATIC ${audio_encoder_interface_list})
SET_TARGET_PROPERTIES(audio_encoder_interface_static PROPERTIES OUTPUT_NAME audio_encoder_interface)


SET(builtin_audio_decoder_factory_internal_list
    audio_coding/codecs/builtin_audio_decoder_factory_internal.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(builtin_audio_decoder_factory_internal_static STATIC ${builtin_audio_decoder_factory_internal_list})
SET_TARGET_PROPERTIES(builtin_audio_decoder_factory_internal_static PROPERTIES OUTPUT_NAME builtin_audio_decoder_factory_internal)

SET(rent_a_codec_list
    audio_coding/acm2/acm_codec_database.cc
    audio_coding/acm2/rent_a_codec.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(rent_a_codec_static STATIC ${rent_a_codec_list})
SET_TARGET_PROPERTIES(rent_a_codec_static PROPERTIES OUTPUT_NAME rent_a_codec)















SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










