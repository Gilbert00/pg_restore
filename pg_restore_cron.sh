#!/bin/bash
#
# v 0.0.2
#

#set -x

if [ $# -eq 0 ]; then
  echo "Usage: $(basename $0) <ServerTo short name>"
	exit 1
fi

readonly DirParams=/opt/VRTSnbu/root/bin
readonly FileParams="$DirParams/pg_restore_params.txt"
readonly TstLog="$DirParams/pg_restore_sched_tst.log"

readonly Err="***Error***:"

# echo "NB_ORA_SERV:$NB_ORA_SERV" >> $TstLog
# echo "NB_ORA_CLIENT:$NB_ORA_CLIENT" >> $TstLog
# echo "NB_ORA_POLICY:$NB_ORA_POLICY" >> $TstLog
# echo "NB_ORA_PC_SCHED:$NB_ORA_PC_SCHED" >> $TstLog

# if [[ -z $NB_ORA_PC_SCHED ]]; then  
  # echo "${Err}Scheduler name is empty !"  >> $TST_LOG
  # exit_proc 10001
# fi

Sched=$1

VcsState=$(/opt/VRTSvcs/bin/hastatus -summary | grep "ClusterService" |grep "$(hostname -s)" | awk '{print $6}')
[[ $VcsState != "ONLINE" ]] && exit 0 

SchedTest=$(egrep "^$Sched." $FileParams | awk -F, '{print $1}')
if [[ -z $SchedTest ]]; then  
  echo "${Err}Scheduler name $Sched is absent in params !"  >> $TST_LOG
  exit_proc 10002
fi

SrvFrom=$(egrep "^$Sched\." $FileParams | awk -F, '{print $2}')
SrvTo=$(egrep "^$Sched\." $FileParams | awk -F, '{print $1}')
SrvMedia=$(egrep "^$Sched\." $FileParams | awk -F, '{print $3}')
Bckp=$(egrep "^$Sched\." $FileParams | awk -F, '{print $4}')
DirRnm=$(egrep "^$Sched\." $FileParams | awk -F, '{print $5}')

echo "Before pg_restore_internal"
#exit 

$DirParams/pg_restore_internal "$SrvFrom" $SrvTo $SrvMedia $Bckp $DirRnm

#$DirParams/pg_restore_internal "$SrvFrom" $SrvTo $SrvMedia $Bckp #$DirRnm

