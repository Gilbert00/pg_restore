#!/bin/bash
#
#
export NB_ORA_SERV=ubkp-nbu.region.vtb.ru
export NB_ORA_CLIENT=ubkp-nbu.region.vtb.ru 
export NB_ORA_POLICY=1178_pg_restore_sched
export NB_ORA_PC_SCHED=ltsmib-pg5011lp

./pg_restore_sched.sh