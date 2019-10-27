#!/bin/bash

function PrintUsage()
{
	echo -e "Usage:"
	echo -e "./build.sh $ToolChain"
	echo -e "ToolChain: arm-linux"
	echo -e "EGG:"
	echo -e "./build.sh arm-linux"
}


if [ $# == 0 ]; then
	PrintUsage
	exit -1
else

	cd api
	sh build.sh $1
	if [ $? -ne 0]; then
		exit -1
	fi
	cd ..
	
	cd audio
	sh build.sh $1
	if [ $? -ne 0]; then
		exit -1
	fi
	cd ..
	
	cd base
	sh build.sh $1
	if [ $? -ne 0]; then
		exit -1
	fi
	cd ..
	
	cd call
	sh build.sh $1
	if [ $? -ne 0]; then
		exit -1
	fi
	cd ..
fi




