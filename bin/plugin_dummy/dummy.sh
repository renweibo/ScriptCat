#!/bin/bash


function plugin_dummy_usage(){
	echo "  ${Script_Cat_Name} Dummy usage in ${Script_Cat_Path}/bin/plugin_dummy directory!"
}

function plugin_dummy_dummy(){
	echo "  ${Script_Cat_Name} Dummy command in ${Script_Cat_Path}/bin/plugin_dummy directory!"
	echo "  Arg1=$1"
	echo "  Arg2=$2"
}

[ $# -eq 0 ] && plugin_dummy_usage && exit 0
COMMAND="$1"; shift

case $COMMAND in
dummy)
    plugin_dummy_dummy $@ 
    ;;
*)
	plugin_dummy_usage
	;;
esac
