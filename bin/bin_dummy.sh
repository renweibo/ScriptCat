#!/bin/bash


function usage(){
	echo "  ${Script_Cat_Name} bin_dummy (usage|main)"
}

function main(){
	echo "  call ${Script_Cat_Name} bin_dummy main"
	echo "  Arg1=$1"
	echo "  Arg2=$2"
}

[ $# -eq 0 ] && usage && exit 0
COMMAND="$1"; shift

case $COMMAND in
main)
    main $@ 
    ;;
*)
	usage
	;;
esac
