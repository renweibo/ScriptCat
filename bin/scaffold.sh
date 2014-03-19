#!/bin/bash


function usage(){
	echo "  $0 scaffold script <script name>"
	echo "  $0 scaffold plugin <plugin name>"
}

function script(){
    local script_name=$1
    cp ${Script_Cat_Path}/bin/bin_dummy.sh ${Script_Cat_Path}/bin/${script_name}.sh
    sed -i s/bin_dummy/${script_name}/g ${Script_Cat_Path}/bin/${script_name}.sh
    sed -i s/Dummy/${script_name}/g ${Script_Cat_Path}/bin/${script_name}.sh
    sed -i s/dummy/${script_name}/g ${Script_Cat_Path}/bin/${script_name}.sh
    ${0} ${script_name} 
    ${0} ${script_name} none
    ${0} ${script_name} usage
    ${0} ${script_name} ${script_name}
}
function plugin(){
    export plugin_name=$1
    cp -r bin/plugin_dummy bin/${plugin_name}
    find ${Script_Cat_Path}/bin/${plugin_name} -type f -exec sed -i s/plugin_dummy/${plugin_name}/g {} \;
    find ${Script_Cat_Path}/bin/${plugin_name} -type f -exec sed -i s/Dummy/${plugin_name}/g {} \;
    find ${Script_Cat_Path}/bin/${plugin_name} -type f -exec sed -i s/dummy/${plugin_name}/g {} \;
    ${0} ${plugin_name} 
    ${0} ${plugin_name} none
    ${0} ${plugin_name} ${plugin_name}
}

[ $# -eq 0 ] && usage && exit 0
COMMAND="$1"; shift

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
