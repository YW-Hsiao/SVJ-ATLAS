#!/bin/bash
# Program:
#     This program is use DelphesPythia8 to do the Pythia and Delphes simultaion
#     about t-channel with CKKW-L.
#     Random:seed = 1111
#     Merging:doPTLundMerging = off
#     Merging:doKTMerging = on
#     close:
#     TimeShower:pTmaxMatch = 1; Merging:muFac = 91.188; Merging:muRen = 91.188;
#     Merging:muFacInME = 91.188; Merging:muRenInME = 91.188; Check:epTolErr = 2e-2
#     LHEFInputs:nSubruns = 1; Main:subrun = 0
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History: 2021/03/23
#     First release
# Version: v.1.0

# Setup environment and variables
now=$(date)
path_tChCkkwl="/youwei_home/SVJ_ATLAS/t-channel_ckkwl-v3"
path_DP8="$path_tChCkkwl/DelphesPythia8"
path_Delphes="/root/Delphes-3.4.2"


# Check your .cmnd file Beams:LHEF path, number of event, and random seed!!   ###
# Check your .tcl file  ###
echo "Start Running"
echo "date: $now"
echo "Path of scrpit: $path_DP8"
echo "Path of DelphesPythia8: $path_Delphes"
echo "Path of .cmnd, .tcl, .log, and .root files: $path_DP8"


cd $path_Delphes
nohup ./DelphesPythia8 $path_DP8/delphes_card_ATLAS.tcl $path_DP8/svj_ckkwl-4.cmnd $path_DP8/svj_ckkwl-4.root > $path_DP8/svj_ckkwl-4.log 2>&1 &

