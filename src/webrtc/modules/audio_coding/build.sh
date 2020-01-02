#!/bin/bash

function PrintUsage()
{
	echo -e "Usage:"
	echo -e "./build.sh $ToolChain"
	echo -e "ToolChain: arm-linux"
	echo -e "EGG:"
	echo -e "./build.sh arm-linux"
}
function GenerateCmakeFile()
{
	CmakeFile="./build/ToolChain.cmake"
	echo "SET(CMAKE_SYSTEM_NAME \"Linux\")" > $CmakeFile
	echo "SET(CMAKE_C_COMPILER \"$1-gcc\")" >> $CmakeFile
	echo "SET(CMAKE_CXX_COMPILER \"$1-g++\")" >> $CmakeFile
}
function BuildLib()
{
	echo -e "Start building ..."
	OutputPath="./build"
	if [ -e "$OutputPath" ]; then
		if [ -e "$OutputPath/lib" ]; then
			echo "/build/lib exit"
		else
			mkdir $OutputPath/lib
		fi
	else
		mkdir $OutputPath
		mkdir $OutputPath/lib
	fi	
	cd build
	cmake ..
	if [ -e "Makefile" ]; then	
		make -j4 > /dev/null
		if [ $? == 0 ]; then
			echo "make success! "
		else
			echo "make failed! "
			exit -1
		fi
	else
		echo "Makefile generated failed! "
		exit -1
	fi
	cd ..
}

function CopyLib()
{
	CurPwd = $PWD
	cd $1
	if [ -e "lib" ]; then
		echo "lib exit"
	else
		mkdir lib
	fi
	
	cd lib
	if [ -e "webrtc" ]; then
		echo "webrtc exit"
	else
		mkdir webrtc
	fi
	
	cd webrtc
	if [ -e "modules" ]; then
		echo "modules exit"
	else
		mkdir modules
	fi
	
	cd modules
	if [ -e "audio_coding" ]; then
		echo "audio_coding exit"
	else
		mkdir audio_coding
	fi
	
	cd audio_coding
	cp $CurPwd/build/lib/libaudio_encoder_interface.a .
	cp $CurPwd/build/lib/libvideo_frame_api.a .
	cp $CurPwd/build/lib/libaudio_codecs_api.a .
	cp $CurPwd/build/lib/libbuiltin_audio_decoder_factory.a .
	cp $CurPwd/build/lib/librent_a_codec.a .
	cp $CurPwd/build/lib/libisac_common.a .	
	cp $CurPwd/build/lib/libisac_fix_c.a .	
	cp $CurPwd/build/lib/libneteq_decoder_enum.a .		
	cp $CurPwd/build/lib/libisac_fix_c.a .		
	
}

if [ $# == 0 ]; then
	PrintUsage
	exit -1
else
	GenerateCmakeFile $1
	BuildLib
	CopyLib ../../../build
fi




