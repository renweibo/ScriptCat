#!/bin/bash


function usage(){
	echo "  ${Script_Cat_Name} scaffold script <script name>"
	echo "  ${Script_Cat_Name} scaffold plugin <plugin name>"
}

function script(){
    local script_name=$1
    cp ${Script_Cat_Path}/bin/bin_dummy.sh ${Script_Cat_Path}/bin/${script_name}.sh
    sed -i s/bin_dummy/${script_name}/g ${Script_Cat_Path}/bin/${script_name}.sh
    ${Script_Cat_Path}/${Script_Cat_Name} ${script_name} 
    ${Script_Cat_Path}/${Script_Cat_Name} ${script_name} none
    ${Script_Cat_Path}/${Script_Cat_Name} ${script_name} usage
    ${Script_Cat_Path}/${Script_Cat_Name} ${script_name} main hello world
}
function plugin(){
    export plugin_name=$1
    cp -r bin/plugin_dummy bin/${plugin_name}
    find ${Script_Cat_Path}/bin/${plugin_name} -type f -exec sed -i s/plugin_dummy/${plugin_name}/g {} \;
    find ${Script_Cat_Path}/bin/${plugin_name} -type f -exec sed -i s/Dummy/${plugin_name}/g {} \;
    find ${Script_Cat_Path}/bin/${plugin_name} -type f -exec sed -i s/dummy/${plugin_name}/g {} \;
    ${Script_Cat_Path}/${Script_Cat_Name} ${plugin_name} 
    ${Script_Cat_Path}/${Script_Cat_Name} ${plugin_name} none
    ${Script_Cat_Path}/${Script_Cat_Name} ${plugin_name} usage
    ${Script_Cat_Path}/${Script_Cat_Name} ${plugin_name} ${plugin_name} hello world
}

[ $# -eq 0 ] && usage && exit 0
COMMAND="$1"; shift
echo COMMAN=$COMMAND

case $COMMAND in
script)
    script $@ 
    ;;
plugin)
    plugin $@ 
    ;;
*)
	usage
	;;
esac
