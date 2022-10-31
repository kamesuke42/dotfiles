#!/bin/bash

PROJ_ROOT=`pwd`
OS=$(uname -s)

case $OS in
    "Linux")
        bash linux.sh $PROJ_ROOT
        ;;
esac
