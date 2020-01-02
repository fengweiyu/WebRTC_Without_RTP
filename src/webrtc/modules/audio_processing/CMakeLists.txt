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


SET(audio_processing_list
    aec/aec_core.cc
    aec/aec_resampler.cc
    aec/echo_cancellation.cc
    aec3/adaptive_fir_filter.cc
    aec3/aec3_common.cc
    aec3/aec3_fft.cc
    aec3/aec_state.cc
    aec3/block_framer.cc
    aec3/block_processor.cc
    aec3/block_processor_metrics.cc
    aec3/cascaded_biquad_filter.cc
    aec3/comfort_noise_generator.cc
    aec3/decimator_by_4.cc
    aec3/echo_canceller3.cc
    aec3/echo_path_delay_estimator.cc
    aec3/echo_path_variability.cc
    aec3/echo_remover.cc
    aec3/echo_remover_metrics.cc
    aec3/erl_estimator.cc
    aec3/erle_estimator.cc
    aec3/fft_buffer.cc
    aec3/frame_blocker.cc
    aec3/main_filter_update_gain.cc
    aec3/matched_filter.cc
    aec3/matched_filter_lag_aggregator.cc
    aec3/output_selector.cc
    aec3/power_echo_model.cc
    aec3/render_delay_buffer.cc
    aec3/render_delay_controller.cc
    aec3/render_delay_controller_metrics.cc
    aec3/render_signal_analyzer.cc
    aec3/residual_echo_estimator.cc
    aec3/shadow_filter_update_gain.cc
    aec3/subtractor.cc
    aec3/suppression_filter.cc
    aec3/suppression_gain.cc
    aecm/aecm_core.cc
    aecm/echo_control_mobile.cc
    agc/agc.cc
    agc/agc_manager_direct.cc
    agc/loudness_histogram.cc
    agc/utility.cc
    audio_buffer.cc
    audio_processing_impl.cc
    beamformer/array_util.cc
    beamformer/covariance_matrix_generator.cc
    beamformer/nonlinear_beamformer.cc
    echo_cancellation_impl.cc
    echo_control_mobile_impl.cc
    echo_detector/circular_buffer.cc
    echo_detector/mean_variance_estimator.cc
    echo_detector/moving_max.cc
    echo_detector/normalized_covariance_estimator.cc
    gain_control_for_experimental_agc.cc
    gain_control_impl.cc
    include/audio_processing.cc
    include/config.cc
    level_controller/biquad_filter.cc
    level_controller/down_sampler.cc
    level_controller/gain_applier.cc
    level_controller/gain_selector.cc
    level_controller/level_controller.cc
    level_controller/noise_level_estimator.cc
    level_controller/noise_spectrum_estimator.cc
    level_controller/peak_level_estimator.cc
    level_controller/saturating_gain_estimator.cc
    level_controller/signal_classifier.cc
    level_estimator_impl.cc
    logging/apm_data_dumper.cc
    low_cut_filter.cc
    noise_suppression_impl.cc
    residual_echo_detector.cc
    rms_level.cc
    splitting_filter.cc
    three_band_filter_bank.cc
    transient/moving_moments.cc
    transient/transient_detector.cc
    transient/transient_suppressor.cc
    transient/wpd_node.cc
    transient/wpd_tree.cc
    typing_detection.cc
    utility/block_mean_calculator.cc
    utility/delay_estimator.cc
    utility/delay_estimator_wrapper.cc
    utility/ooura_fft.cc
    vad/gmm.cc
    vad/pitch_based_vad.cc
    vad/pitch_internal.cc
    vad/pole_zero_filter.cc
    vad/standalone_vad.cc
    vad/vad_audio_proc.cc
    vad/vad_circular_buffer.cc
    vad/voice_activity_detector.cc
    voice_detection_impl.cc
	)		
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}
	${PROJECT_SOURCE_DIR}/../../
	../base
	)
ADD_LIBRARY(audio_processing_static STATIC ${audio_processing_list})
SET_TARGET_PROPERTIES(audio_processing_static PROPERTIES OUTPUT_NAME audio_processing)







SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build/lib)

#TARGET_LINK_LIBRARIES(webrtc pthread -lm)

#TARGET_LINK_LIBRARIES(crnode log4cpp thrift)










