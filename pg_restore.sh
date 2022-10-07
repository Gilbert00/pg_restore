
#SrvFrom=p0smib-pg5005lp.region.vtb.ru
#SrvTo=ltsmib-pg5009lp.test.vtb.ru
#SrvFrom=p0smib-pg5006lp.region.vtb.ru
#SrvTo=ltsmib-pg5011lp.test.vtb.ru
#SrvFrom=p0spcp-pg5001lv.region.vtb.ru
#SrvTo=rrspcs-pgc001lv.test.vtb.ru

#SrvFrom=p0crsl-pg2001lv.region.vtb.ru
#SrvTo=rrcrsl-pgc001lk.test.vtb.ru


SrvMedia=ubkp-nbu514l.test.vtb.ru
#SrvMedia=ubkp-nbu214l.region.vtb.ru
#Bckp=pgbackup_p0smib-pg5005lp.region.vtb.ru_21.07.2022-02.05
#Bckp=pgbackup_p0smib-pg5006lp.region.vtb.ru_21.07.2022-02.05
#Bckp=pgbackup_p0spcp-pg5001lv.region.vtb.ru_27.07.2022-00.05
#Bckp=pgbackup_p0crsl-pg2001lv.region.vtb.ru_17.08.2022-01.05

SrvFrom=p0smib-pg5005lp.region.vtb.ru 
SrvTo=ltsmib-pg5009lp.test.vtb.ru
Bckp=pgbackup_p0smib-pg5005lp.region.vtb.ru_18.08.2022-02.05

SrvFrom=p0smib-pg5006lp.region.vtb.ru 
SrvTo=ltsmib-pg5011lp.test.vtb.ru
Bckp=pgbackup_p0smib-pg5006lp.region.vtb.ru_18.08.2022-02.05

SrvFrom=p0smib-pg2002lv.region.vtb.ru 
SrvTo=ltsmbi-pg5004lv.test.vtb.ru
Bckp=pgbackup_p0smib-pg2002lv.region.vtb.ru_18.08.2022-02.05

SrvFrom=p0curs-pg5001lv.region.vtb.ru 
SrvTo=hfcurs-pgc003lk.test.vtb.ru
Bckp=pgbackup_p0curs-pg5001lv.region.vtb.ru_19.08.2022-02.05

SrvFrom=p0smib-pg2001lv.region.vtb.ru 
SrvTo=ltsmib-pg5002lv.test.vtb.ru 
Bckp=pgbackup_p0smib-pg2001lv.region.vtb.ru_18.08.2022-01.05


SrvFrom=p0smbi-pg5002lv.region.vtb.ru 
SrvTo=ltsmbi-pg5003lv.test.vtb.ru 
Bckp=pgbackup_p0smbi-pg5002lv.region.vtb.ru_25.08.2022-02.05

SrvFrom=p0smbi-pg5001lv.region.vtb.ru 
SrvTo=ltsmbi-pg5001lv.test.vtb.ru 
Bckp=pgbackup_p0smbi-pg5001lv.region.vtb.ru_25.08.2022-02.05

SrvFrom=p0smib-pg5003lv.region.vtb.ru 
SrvTo=ltsmib-pg5005lv.test.vtb.ru
Bckp=pgbackup_p0smib-pg5003lv.region.vtb.ru_26.08.2022-02.05

SrvFrom=p0paym-pg5001lv.region.vtb.ru 
SrvTo=ltpaym-pgc004lv.test.vtb.ru
Bckp=last

SrvFrom="p0pzpd-pg2001lv.region.vtb.ru p0pzpd-pg5001lv.region.vtb.ru" 
SrvTo=rrpzpc-pgc002lk.test.vtb.ru
Bckp=last

SrvFrom="p0paym-pg5001lv.region.vtb.ru p0paym-pg2001lv.region.vtb.ru" 
SrvTo=ltpaym-pgc004lv.test.vtb.ru
Bckp=last

SrvFrom=p0mole-pg5006lv.region.vtb.ru 
SrvTo=rrmole-pgc001lk.test.vtb.ru
Bckp=pgbackup_p0mole-pg5006lv.region.vtb.ru_05.09.2022-02.05

SrvFrom=p0ipog-pg5002lv.region.vtb.ru 
SrvTo=ltipog-pgc009lv.test.vtb.ru
Bckp=last

SrvFrom="p0pzpd-pg2001lv.region.vtb.ru p0pzpd-pg5001lv.region.vtb.ru" 
SrvTo=rrpzpc-pgc001lk.test.vtb.ru
Bckp=last

#RFT-004010486
#SrvMedia=ubkp-nbu512l.region.vtb.ru
SrvFrom=ditiin-pg5001lv.region.vtb.ru
SrvTo=p0tdfm-pg5004lv.region.vtb.ru
Bckp=pgbackup_ditiin-pg5001lv.region.vtb.ru_21.09.2022-02.05

#RFT-004042184
SrvFrom=p0acrq-pg2001lv.region.vtb.ru
SrvTo=rracrq_pgc001lk.test.vtb.ru
Bckp=pgbackup_p0acrq-pg2001lv.region.vtb.ru_16.09.2022-01.05


DirRnm=""
DirRnm=pg_data
#DirRnm=pg_data/bk

FileOut="./pg_restore.out"
date +%Y.%m.%d_%H:%M:%S >> $FileOut
/root/bin/pg_restore_internal "$SrvFrom" $SrvTo $SrvMedia $Bckp $DirRnm 2>&1 | tee -a $FileOut
echo "" | tee -a $FileOut

#/root/bin/pg_restore_internal "$SrvFrom" $SrvTo $SrvMedia $Bckp #$DirRnm


