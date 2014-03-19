#!/bin/bash


function usage(){
	echo "  Dummy usage in ${Script_Cat_Path}/bin directory!"
}

function dummy(){
	echo "  Dummy command in ${Script_Cat_Path}/bin directory!"
	echo "  Arg1=$1"
	echo "  Arg2=$2"
}

[ $# -eq 0 ] && usage && exit 0
COMMAND="$1"; shift

case $COMMAND in
dummy)
    dummy $@ 
    ;;
*)
	usage
	;;
esac
