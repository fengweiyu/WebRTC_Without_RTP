#!/bin/bash

function PrintUsage()
{
	echo -e "Usage:"
	echo -e "./build.sh $ToolChain"
	echo -e "ToolChain: arm-linux"
	echo -e "EGG:"
	echo -e "./build.sh arm-linux"
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
	if [ -e "api" ]; then
		echo "api exit"
	else
		mkdir api
	fi
	cp $CurPwd/build/lib/libapi.a .
	
}

if [ $# == 0 ]; then
	PrintUsage
	exit -1
else
	BuildLib
	CopyLib ../../../build
fi




