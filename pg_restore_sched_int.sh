#!/bin/bash
#
# v 0.1.0
#

#set -x

readonly DirParams=/opt/VRTSnbu/root/bin
#readonly FileParams="$DirParams/pg_restore_params.txt"
readonly FileProdParams="$DirParams/pg_restore_params_prod.txt"
readonly FileNtParams="$DirParams/pg_restore_params_nt.txt"

readonly TstLog="$DirParams/pg_restore_sched_tst_$$.log"

readonly Err="***Error***:"

function check_param_file() {
# $FileParam
	if [[ ! -f $1 ]]; then
		echo "${Err}Parameters file $1 don't exists !"  >> $TST_LOG
		exit 10003
	fi
}

check_param_file $FileProdParams
check_param_file $FileNtParams

echo "NB_ORA_SERV:$NB_ORA_SERV" >> $TstLog
echo "NB_ORA_CLIENT:$NB_ORA_CLIENT" >> $TstLog
echo "NB_ORA_POLICY:$NB_ORA_POLICY" >> $TstLog
echo "NB_ORA_PC_SCHED:$NB_ORA_PC_SCHED" >> $TstLog

if [[ -z $NB_ORA_PC_SCHED ]]; then  
  echo "${Err}Scheduler name is empty !"  >> $TST_LOG
  exit 10001
fi

Sched=$NB_ORA_PC_SCHED
check_sched() {
# $Sched $FileParam
	local SchedTest=$(egrep "^$1," $2 | awk -F, '{print $1}')
	if [[ -z $SchedTest ]]; then  
		echo "${Err}Scheduler name $1 is absent in parameters file $2 !"  >> $TST_LOG
		exit 10002
	fi
}

check_sched $Sched $FileProdParams
check_sched $Sched $FileNtParams

SrvFrom="$(egrep "^$Sched," $FileProdParams | awk -F, '{print $2}')"
SrvTo=$(egrep "^$Sched," $FileNtParams | awk -F, '{print $2}')
SrvMedia=$(egrep "^$Sched," $FileNtParams | awk -F, '{print $3}')
Bckp=$(egrep "^$Sched," $FileProdParams | awk -F, '{print $3}')
DirRnm=$(egrep "^$Sched," $FileNtParams | awk -F, '{print $4}')

date +%Y.%m.%d_%H:%M:%S
echo "Before pg_restore_internal"
#exit 

$DirParams/pg_restore_internal "$SrvFrom" $SrvTo $SrvMedia $Bckp $DirRnm

echo ""

