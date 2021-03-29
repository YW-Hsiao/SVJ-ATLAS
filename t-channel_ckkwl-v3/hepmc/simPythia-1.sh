#!/bin/bash
# Program:
#     This program is to do the Pythia simultaion about t-channel with CKKW-L.
#     Random:seed = 1111
#     Merging:doPTLundMerging = on
#     Merging:doKTMerging = off
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History: 2021/03/17
#     First release
# Version: v.1.0

# Setup environment and variables
now=$(date)
path_tChCkkwl="/youwei_home/SVJ_ATLAS/t-channel_ckkwl-v3"
path_hepmc="$path_tChCkkwl/hepmc"
path_examples="/root/pythia8245/examples"


# Check your .cmnd file Beams:LHEF path, number of event, and random seed!!   ###
echo "Start Running"
echo "date: $now"
echo "Path of scrpit: $path_hepmc"
echo "Path of Pthia examples main89: $path_examples"
echo "Path of .cmnd and .log file: $path_hepmc"


cd $path_examples
nohup ./main89 $path_hepmc/svj_ckkwl-1.cmnd $path_hepmc/ckkwl-1.hepmc > $path_hepmc/ckkwl-1.log 2>&1 &

