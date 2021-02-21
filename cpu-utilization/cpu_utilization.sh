#!/bin/bash
cpuuse=$( mpstat | grep -A 5 "%idle" | tail -n 1 | awk -F " " '{print 100 -  $ 12}'a )
cpuuse=$( printf "%.0f" $cpuuse )
if [ "$cpuuse" -ge 80 ]; then
SUBJECT="ATTENTION: CPU load is high on $(hostname) at $(date)"
MESSAGE="/tmp/Mail.out"
TO="naresh240.qis@gmail.com"
  echo "CPU current usage is: $cpuuse%" >> $MESSAGE
  echo "" >> $MESSAGE
  echo "+------------------------------------------------------------------+" >> $MESSAGE
  echo "Top 20 processes which consuming high CPU" >> $MESSAGE
  echo "+------------------------------------------------------------------+" >> $MESSAGE
  echo "$(top -bn1 | head -20)" >> $MESSAGE
  echo "" >> $MESSAGE
  echo "+------------------------------------------------------------------+" >> $MESSAGE
  echo "Top 10 Processes which consuming high CPU using the ps command" >> $MESSAGE
  echo "+------------------------------------------------------------------+" >> $MESSAGE
  echo "$(ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10)" >> $MESSAGE
  mail -s "$SUBJECT" "$TO" < $MESSAGE
  rm /tmp/Mail.out
else
echo "Server CPU usage is in under threshold"
  fi
