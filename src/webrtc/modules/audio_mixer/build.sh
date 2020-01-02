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
	if [ -e "audio_mixer" ]; then
		echo "audio_mixer exit"
	else
		mkdir audio_mixer
	fi
	
	cd audio_mixer
	cp $CurPwd/build/lib/libaudio_mixer_impl.a .	
	cp $CurPwd/build/lib/libaudio_frame_manipulator.a .	
}

if [ $# == 0 ]; then
	PrintUsage
	exit -1
else
	GenerateCmakeFile $1
	BuildLib
	CopyLib ../../../build
fi




