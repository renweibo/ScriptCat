#!/bin/bash

[ $# -eq 0 ] && bash ${Script_Cat_Path}/bin/usage.sh $Script_Cat_Name && exit 0
COMMAND="$1"; shift

if [ -f ${Script_Cat_Path}/bin/$COMMAND ] ; then
	bash ${Script_Cat_Debug} ${Script_Cat_Path}/bin/$COMMAND $@
elif [ -f ${Script_Cat_Path}/bin/$COMMAND.sh ] ; then
	bash ${Script_Cat_Debug} ${Script_Cat_Path}/bin/$COMMAND.sh $@
elif [ -d ${Script_Cat_Path}/bin/$COMMAND ] ; then
	SUBCOMMAND="$1"; shift
	bash ${Script_Cat_Debug} ${Script_Cat_Path}/bin/$COMMAND/main.sh $SUBCOMMAND $@ 
else
	bash ${Script_Cat_Debug} ${Script_Cat_Path}/bin/usage.sh $Script_Cat_Name
fi
