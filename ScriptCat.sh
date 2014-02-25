#!/bin/bash
export OSBQA_Cat_Path=$(cd "$(dirname "$0")"; pwd)
export OSBQA_Cat_Name=`basename $0`
#export OSBQA_Cat_Debug="-x"

function version(){
	echo "  OSBQA_Cat_Path=${OSBQA_Cat_Path}"
	echo "  OSBQA_Cat_Name=${OSBQA_Cat_Name}"
	echo "  OSBQA_Cat_Debug=${OSBQA_Cat_Debug}"
}

function dummy(){
    echo "  Dummy command!"
}

[ $# -eq 0 ] && bash ${OSBQA_Cat_Debug} ${OSBQA_Cat_Path}/bin/usage.sh `basename $0` && exit 0

COMMAND="$1"; shift

case $COMMAND in
dummy)
    dummy $@ 
    ;;
version)
    version
    ;;
*)
	bash ${OSBQA_Cat_Debug} ${OSBQA_Cat_Path}/bin/main.sh $COMMAND $@
	;;
esac
