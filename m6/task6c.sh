#!/bin/bash
#C. Create a data backup script that takes the following data as parameters:
#1. Path to the syncing directory.
#2. The path to the directory where the copies of the files will be stored.
#In case of adding new or deleting old files, the script must add a
# corresponding entry to the log file
#indicating the time, type of operation and file name.
# [The command to run the script must be added to
# crontab with a run frequency of one minute]

# exec: /home/osboxes/task6/task6c.sh /home/osboxes/task6/testfolder /home/osboxes/task6/backuptestfolder
sync_dir=$1
bckp_dir=$2
log=/home/osboxes/task6/log.txt
#parameters check
if [[ ${#} -ne 2 ]] ; then
    echo "Please provide 2 parameters to the script"
    echo "USAGE: ./task6c.sh Path-to-sync-dir Path-to-backup-dir"
    exit
fi

cd $bckp_dir
#check if file was deleted
for file in *
do
  if [ ! -e $sync_dir/$file ]; then
    echo "$(date +"%D %T") $file was removed ">> $log
    rm $file
  fi
done

cd $sync_dir
for file in *
do
    #check if file is already exists and modified
  if [ -e $bckp_dir/$file ]; then
    if [ $sync_dir/$file -nt $bckp_dir/$file ]; then
      echo "$(date +"%D %T") $file was modified, replacing" >> $log
      cp -r $file $bckp_dir
    fi
  else
    echo "$(date +"%D %T") adding $file" >> $log
    cp -r $file $bckp_dir
  fi
done


