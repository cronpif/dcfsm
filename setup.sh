#/system/bin/sh
echo 'DCFSM Installation Setup'
echo 'Desc. at  README'
echo 'Directory to Install:'
read $PATH
if [test $PATH -e ""];then
exit
fi
TP = $PATH /DCFM
DP = /system/xbin
echo "Make Directory $TP";
mkdir $TP
echo "Copying file to $TP";
cp /script/* $DP
echo "Setting cron rule for DCFM";
echo "0 0 * * *  $DP/script/maintenance.sh  " > /etc/cron.d/cronrun
echo "#/system/bin/sh /n $DP/script/w.sh" > /data/local/userinit.sh
echo "$DP/script/dcaminer.sh"> /data/local/userinit.sh
chmod +x $DP/script/bin/*
chmod +x $DP/script/*
echo "Succeded!,Reboot";
reboot