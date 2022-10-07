#!/bin/bash
#
# v 0.0.3
#

#set -x

readonly DirParams=/opt/VRTSnbu/root/bin
readonly FileParams="$DirParams/pg_restore_params.txt"
readonly TstLog="$DirParams/pg_restore_sched_tst_$$.log"

readonly Err="***Error***:"

echo "NB_ORA_SERV:$NB_ORA_SERV" >> $TstLog
echo "NB_ORA_CLIENT:$NB_ORA_CLIENT" >> $TstLog
echo "NB_ORA_POLICY:$NB_ORA_POLICY" >> $TstLog
echo "NB_ORA_PC_SCHED:$NB_ORA_PC_SCHED" >> $TstLog

if [[ -z $NB_ORA_PC_SCHED ]]; then  
  echo "${Err}Scheduler name is empty !"  >> $TST_LOG
  exit_proc 10001
fi

Sched=$NB_ORA_PC_SCHED
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

date +%Y.%m.%d_%H:%M:%S
echo "Before pg_restore_internal"
#exit 

$DirParams/pg_restore_internal "$SrvFrom" $SrvTo $SrvMedia $Bckp $DirRnm

#$DirParams/pg_restore_internal "$SrvFrom" $SrvTo $SrvMedia $Bckp #$DirRnm

echo ""

