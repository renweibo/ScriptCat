#!/bin/bash


function utils_usage(){
	echo "  ${Script_Cat_Name} Dummy usage in ${Script_Cat_Path}/bin/utils directory!"
}

function utils_dummy(){
	echo "  ${Script_Cat_Name} Dummy command in ${Script_Cat_Path}/bin/utils directory!"
	echo "  Arg1=$1"
	echo "  Arg2=$2"
}

[ $# -eq 0 ] && utils_usage && exit 0
COMMAND="$1"; shift

case $COMMAND in
dummy)
    utils_dummy $@ 
    ;;
*)
	utils_usage
	;;
esac
