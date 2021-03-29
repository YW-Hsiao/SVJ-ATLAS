#!/bin/bash
# Program:
#     This program is to do the MadGraph simultaion about t-channel with CKKW-L jet matching/merging.
#     .txt is with nevents 10000
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History: 2021/03/17
#     First release
# Version: v.1.0

# Setup environment and variables
now=$(date)
path_tChCkkwl="/youwei_home/SVJ_ATLAS/t-channel_ckkwl-v1"
path_MG5v273="/root/MG5_aMC_v2_7_3"  # Where is your mg5_aMC


# Check your .txt file output and launch path and number of event!!   ###
echo "Start Running"
echo "date: $now"
echo "Path of scrpit: $path_tChCkkwl"
echo "Path of MG5: $path_MG5v273"
echo "Path of .txt and .log file: $path_tChCkkwl"


cd $path_MG5v273
nohup ./bin/mg5_aMC $path_tChCkkwl/svj_MG.txt > $path_tChCkkwl/svj_MG.log 2>&1 &

