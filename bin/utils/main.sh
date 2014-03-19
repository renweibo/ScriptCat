#!/bin/bash

[ $# -eq 0 ] && bash ${Script_Cat_Path}/bin/utils/usage.sh $Script_Cat_Name && exit 0
COMMAND="$1"; shift

function utils_path(){
	echo "  Path"
}

case $COMMAND in
utils_path)
    utils_path $@ 
    ;;
*)
	if [ -f ${Script_Cat_Path}/bin/utils/$COMMAND ] ; then
		bash ${Script_Cat_Debug} ${Script_Cat_Path}/bin/utils/$COMMAND $@
	elif [ -f ${Script_Cat_Path}/bin/utils/$COMMAND.sh ] ; then
		bash ${Script_Cat_Debug} ${Script_Cat_Path}/bin/utils/$COMMAND.sh $@
	elif [ -d ${Script_Cat_Path}/bin/utils/$COMMAND ] ; then
		SUBCOMMAND="$1"; shift
		bash ${Script_Cat_Debug} ${Script_Cat_Path}/bin/utils/$COMMAND/main.sh $SUBCOMMAND $@ 
	else
		bash ${Script_Cat_Debug} ${Script_Cat_Path}/bin/utils/usage.sh $Script_Cat_Name
	fi
    ;;
esac
