Dir="/usr/openv/netbackup/logs/user_ops/"
Dir="/root/pg_rest/"
for F in "ls ${Dir}pg_restore_*.log"
do
  echo $F
  gzip $F
done