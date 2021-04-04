#!/bin/bash

# Soal 1 a
grep -oE "(INFO.*)|(ERROR.*)" syslog.log > syslog.txt;

# Soal 1 b
printf "Error line :\n";
grep -oE "ERROR\s([A-Z])([a-z]+)(\s[a-zA-Z']+){1,6}" syslog.log;
printf "==========================\n";
echo "$(grep -oE 'ERROR.*' syslog.log)" | grep -oE "([A-Z][a-z]+)\s(['A-Za-z]+\s){1,6}" | sort | uniq |
    while read -r row
    do
        countError=$(grep -c "$row" syslog.log);
        echo "$row,$countError";
    done | sort -rt',' -nk2;
printf "==========================\n";
printf "Total semua kemunculan error : %d\n" $(grep -c "ERROR" syslog.log); # Menghitung jumlah kata ERROR

# Soal 1 d
printf "ERROR,COUNT\n" > "error_message.csv"; #header
echo "$(grep -oE 'ERROR.*' syslog.log)" | grep -oE "([A-Z][a-z]+)\s(['A-Za-z]+\s){1,6}" | sort | uniq |
    while read -r row
    do
        countError=$(grep -c "$row" syslog.log);
        echo "$row,$countError";
    done | sort -rt',' -nk2 >> error_message.csv;