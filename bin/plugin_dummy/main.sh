#!/bin/bash

[ $# -eq 0 ] && bash ${Script_Cat_Path}/bin/plugin_dummy/usage.sh $Script_Cat_Name && exit 0
COMMAND="$1"; shift

function plugin_dummy_path(){
	echo "  Path"
}

case $COMMAND in
plugin_dummy_path)
    plugin_dummy_path $@ 
    ;;
*)
	if [ -f ${Script_Cat_Path}/bin/plugin_dummy/$COMMAND ] ; then
		bash ${Script_Cat_Debug} ${Script_Cat_Path}/bin/plugin_dummy/$COMMAND $@
	elif [ -f ${Script_Cat_Path}/bin/plugin_dummy/$COMMAND.sh ] ; then
		bash ${Script_Cat_Debug} ${Script_Cat_Path}/bin/plugin_dummy/$COMMAND.sh $@
	elif [ -d ${Script_Cat_Path}/bin/plugin_dummy/$COMMAND ] ; then
		SUBCOMMAND="$1"; shift
		bash ${Script_Cat_Debug} ${Script_Cat_Path}/bin/plugin_dummy/$COMMAND/main.sh $SUBCOMMAND $@ 
	else
		bash ${Script_Cat_Debug} ${Script_Cat_Path}/bin/plugin_dummy/usage.sh $Script_Cat_Name
	fi
    ;;
esac
