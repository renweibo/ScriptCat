#!/bin/bash
export Script_Cat_Path=$(cd "$(dirname "$0")"; pwd)
export Script_Cat_Name=`basename $0`
#export Script_Cat_Debug="-x"

function version(){
	echo "  Script_Cat_Path=${Script_Cat_Path}"
	echo "  Script_Cat_Name=${Script_Cat_Name}"
	echo "  Script_Cat_Debug=${Script_Cat_Debug}"
}

function dummy(){
    echo "  Dummy command!"
}

[ $# -eq 0 ] && bash ${Script_Cat_Debug} ${Script_Cat_Path}/bin/usage.sh `basename $0` && exit 0

COMMAND="$1"; shift

case $COMMAND in
dummy)
    dummy $@ 
    ;;
version)
    version
    ;;
*)
	bash ${Script_Cat_Debug} ${Script_Cat_Path}/bin/main.sh $COMMAND $@
	;;
esac
