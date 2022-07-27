
#SrvFrom=p0smib-pg5005lp.region.vtb.ru
#SrvTo=ltsmib-pg5009lp.test.vtb.ru
SrvFrom=p0smib-pg5006lp.region.vtb.ru
SrvTo=ltsmib-pg5011lp.test.vtb.ru

SrvMedia=ubkp-nbu514l.test.vtb.ru
#SrvMedia=ubkp-nbu214l.region.vtb.ru
#Bckp=pgbackup_p0smib-pg5005lp.region.vtb.ru_21.07.2022-02.05
Bckp=pgbackup_p0smib-pg5006lp.region.vtb.ru_21.07.2022-02.05

DirRnm=pg_data

/root/bin/pg_restore_internal $SrvFrom $SrvTo $SrvMedia $Bckp #$DirRnm


