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
	codecs/audio_encoder.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(audio_encoder_interface_static STATIC ${audio_encoder_interface_list})
SET_TARGET_PROPERTIES(audio_encoder_interface_static PROPERTIES OUTPUT_NAME audio_encoder_interface)


SET(builtin_audio_decoder_factory_internal_list
    codecs/builtin_audio_decoder_factory_internal.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(builtin_audio_decoder_factory_internal_static STATIC ${builtin_audio_decoder_factory_internal_list})
SET_TARGET_PROPERTIES(builtin_audio_decoder_factory_internal_static PROPERTIES OUTPUT_NAME builtin_audio_decoder_factory_internal)

SET(rent_a_codec_list
    acm2/acm_codec_database.cc
    acm2/rent_a_codec.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(rent_a_codec_static STATIC ${rent_a_codec_list})
SET_TARGET_PROPERTIES(rent_a_codec_static PROPERTIES OUTPUT_NAME rent_a_codec)


SET(audio_encoder_interface_list
    codecs/audio_encoder.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(audio_encoder_interface_static STATIC ${audio_encoder_interface_list})
SET_TARGET_PROPERTIES(audio_encoder_interface_static PROPERTIES OUTPUT_NAME audio_encoder_interface)


SET(isac_common_list
    codecs/isac/locked_bandwidth_info.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(isac_common_static STATIC ${isac_common_list})
SET_TARGET_PROPERTIES(isac_common_static PROPERTIES OUTPUT_NAME isac_common)


SET(isac_fix_c_list
    codecs/isac/fix/source/arith_routines.c
    codecs/isac/fix/source/arith_routines_hist.c
    codecs/isac/fix/source/arith_routines_logist.c
    codecs/isac/fix/source/bandwidth_estimator.c
    codecs/isac/fix/source/decode.c
    codecs/isac/fix/source/decode_bwe.c
    codecs/isac/fix/source/decode_plc.c
    codecs/isac/fix/source/encode.c
    codecs/isac/fix/source/entropy_coding.c
    codecs/isac/fix/source/filterbank_tables.c
    codecs/isac/fix/source/filterbanks.c
    codecs/isac/fix/source/filters.c
    codecs/isac/fix/source/initialize.c
    codecs/isac/fix/source/isacfix.c
    codecs/isac/fix/source/lattice.c
    codecs/isac/fix/source/lattice_c.c
    codecs/isac/fix/source/lpc_masking_model.c
    codecs/isac/fix/source/lpc_tables.c
    codecs/isac/fix/source/pitch_estimator.c
    codecs/isac/fix/source/pitch_estimator_c.c
    codecs/isac/fix/source/pitch_filter.c
    codecs/isac/fix/source/pitch_filter_c.c
    codecs/isac/fix/source/pitch_gain_tables.c
    codecs/isac/fix/source/pitch_lag_tables.c
    codecs/isac/fix/source/spectrum_ar_model_tables.c
    codecs/isac/fix/source/transform.c
    codecs/isac/fix/source/transform_tables.c 
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(isac_fix_c_static STATIC ${isac_fix_c_list})
SET_TARGET_PROPERTIES(isac_fix_c_static PROPERTIES OUTPUT_NAME isac_fix_c)


SET(neteq_decoder_enum_list
    neteq/neteq_decoder_enum.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(neteq_decoder_enum_static STATIC ${neteq_decoder_enum_list})
SET_TARGET_PROPERTIES(neteq_decoder_enum_static PROPERTIES OUTPUT_NAME neteq_decoder_enum)

SET(audio_format_conversion_list
    codecs/audio_format_conversion.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(audio_format_conversion_static STATIC ${audio_format_conversion_list})
SET_TARGET_PROPERTIES(audio_format_conversion_static PROPERTIES OUTPUT_NAME audio_format_conversion)

SET(isac_list
    codecs/isac/main/source/audio_decoder_isac.cc
    codecs/isac/main/source/audio_encoder_isac.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(isac_static STATIC ${isac_list})
SET_TARGET_PROPERTIES(isac_static PROPERTIES OUTPUT_NAME isac)

SET(isac_common_list
    codecs/isac/locked_bandwidth_info.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(isac_common_static STATIC ${isac_common_list})
SET_TARGET_PROPERTIES(isac_common_static PROPERTIES OUTPUT_NAME isac_common)

SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










