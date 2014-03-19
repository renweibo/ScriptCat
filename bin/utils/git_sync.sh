#!/bin/bash


function git_sync_usage(){
	echo "  ${Script_Cat_Name} utils git_sync prepare <WORK_NAME> <SYNC_PATH> <MY_GIT_REPO_BASE_PATH> <MY_GIT_REPO_SYNC_PATH> <MY_GIT_REPO_WORK_PATH>"
}

function f_env_setup(){
    export WORK_NAME=$1
    export SYNC_PATH=$2
    export MY_GIT_REPO_BASE_PATH=$3
    export MY_GIT_REPO_SYNC_PATH=$4
    export MY_GIT_REPO_WORK_PATH=$5
    mkdir -p ${MY_GIT_REPO_BASE_PATH} ${MY_GIT_REPO_SYNC_PATH} ${MY_GIT_REPO_WORK_PATH}
    echo "Sync Path ${SYNC_PATH} with git sync with WORK_NAME=${WORK_NAME}. Setup details"
    echo "  MY_GIT_REPO_BASE_PATH=${MY_GIT_REPO_BASE_PATH}"
    echo "  MY_GIT_REPO_SYNC_PATH=${MY_GIT_REPO_SYNC_PATH}"
    echo "  MY_GIT_REPO_WORK_PATH=${MY_GIT_REPO_WORK_PATH}"
} 
function f_unison_prepare(){
    cat > ~/.unison/${WORK_NAME}.prf  <<EOF
root=${SYNC_PATH}
root=${MY_GIT_REPO_SYNC_PATH}/${WORK_NAME}

ignore = Name core.*
ignore = Name *.log
ignore = Name .git
ignore = Name .gitignore
ignore = Name bootstrap.git.sync
ignore = Name *~
ignore = Name .svn
ignore = Path tmp
EOF
}

function f_git_prepare(){
    git init --bare ${MY_GIT_REPO_BASE_PATH}/${WORK_NAME}.git
    git clone ${MY_GIT_REPO_BASE_PATH}/${WORK_NAME}.git ${MY_GIT_REPO_SYNC_PATH}/${WORK_NAME}
    cd ${MY_GIT_REPO_SYNC_PATH}/${WORK_NAME}
    touch bootstrap.git.sync
    cat >.gitignore <<EOF
*.csv
*.log
*~
.svn
/tmp
EOF
    git add . && git commit -a -m "first import" && git push origin master
    git clone ${MY_GIT_REPO_BASE_PATH}/${WORK_NAME}.git ${MY_GIT_REPO_WORK_PATH}/${WORK_NAME}
}
function f_crontab_script_prepare(){
    cat > ${MY_GIT_REPO_BASE_PATH}/${WORK_NAME}.sync.sh  <<EOF
#!/bin/bash -x -l
unison ${WORK_NAME} -force ${SYNC_PATH} -batch
cd ${MY_GIT_REPO_SYNC_PATH}/${WORK_NAME}
git status
git pull origin master && git add . && git commit -a -m "sync udpate" && git push origin master
EOF
    chmod a+x ${MY_GIT_REPO_BASE_PATH}/${WORK_NAME}.sync.sh
    echo "add crontab with following line"
    echo "0 2 * * * ${MY_GIT_REPO_BASE_PATH}/${WORK_NAME}.sync.sh "
}
function prepare(){
    f_env_setup $1 $2 $3 $4 $5
    f_unison_prepare
    f_git_prepare
    f_crontab_script_prepare
    more ${MY_GIT_REPO_BASE_PATH}/${WORK_NAME}.sync.sh
    cat > ${MY_GIT_REPO_BASE_PATH}/${WORK_NAME}.clean.sh <<EOF
#!/bin/bash -l -x
rm -rf ${MY_GIT_REPO_BASE_PATH}/${WORK_NAME}.sync.sh ${MY_GIT_REPO_BASE_PATH}/${WORK_NAME}.git ${MY_GIT_REPO_SYNC_PATH}/${WORK_NAME} ${MY_GIT_REPO_WORK_PATH}/${WORK_NAME}
EOF
}

[ $# -eq 0 ] && git_sync_usage && exit 0
COMMAND="$1"; shift

case $COMMAND in
prepare)
    prepare $@ 
    ;;
*)
	git_sync_usage
	;;
esac
