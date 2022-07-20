
SrvFrom=p0sgbp-pg2001lv.vtb24.ru
SrvTo=ltsgbp-pgc001lv.test.vtb.ru
SrvMedia=ubkp-nbu514l.test.vtb.ru
Bckp=pgbackup_p0sgbp-pg2001lv.vtb24.ru_13.07.2022-02.05
DirRnm=pg_data

./pg_restore_internal $SrvFrom $SrvTo $SrvMedia $Bckp $DirRnm


