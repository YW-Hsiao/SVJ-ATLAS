#!/bin/bash
# Program:
#     This program is to change PID for t-channel.
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History: 2021/03/17
#     First release
# Version: v.1.0

# Setup environment and variables
now=$(date)
path_tChCkkwl="/youwei_home/SVJ_ATLAS/t-channel_ckkwl-v3"
path_lhe="$path_tChCkkwl/t_0/Events/run_01"



echo "Start Running"
echo "date: $now"
echo "Path of scrpit: $path_tChCkkwl"
echo "Path of .log file: $path_tChCkkwl"

cd $path_lhe
gzip -d unweighted_events.lhe.gz > $path_tChCkkwl/changePID.log 2>&1
echo "------Change PID------" >> $path_tChCkkwl/changePID.log 2>&1
sed -i 's/49001010/4900101/g' unweighted_events.lhe
sed -i 's/49001011/4900101/g' unweighted_events.lhe
sed -i 's/49001012/4900101/g' unweighted_events.lhe
sed -i 's/49001013/4900101/g' unweighted_events.lhe
sed -i 's/49001014/4900101/g' unweighted_events.lhe
grep 4900101 unweighted_events.lhe >> $path_tChCkkwl/changePID.log 2>&1

