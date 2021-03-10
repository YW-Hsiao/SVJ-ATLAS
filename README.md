# SVJ-ATLAS
Abstract: This is JobOptions process.


## 1. JobOptions Process
1. Sign-in your LXPLUS
2. And then we need a environment to work in 24 hours. Therefore, go into LXPLUS screen:  
```
k5reauth -x -f pagsh
aklog
bash
screen
```
3. First, setup your JO.py file and put the JO.py file in a folder, such as joboptions/100012/JO1.py, joboptions/100013/JO2.py, and so on (or jo100012/JO1.py). Notice: Only one JO file in each folder.-red
Similarly, create another folder for running the JO generation process, such as run/100012, run/100013, and so on (or run100012).
4. Setup environment, go into the run folder, and run MadGraph & Pythia simulation:
```
setupATLAS
asetup 21.6.51,AthGeneration
cd <where>/run/10001x e.g. cd <where>/run/100012
Gen_tf.py --ecmEnergy=13000. --maxEvents=20000 --firstEvent=1 --randomSeed=111 --outputEVNTFile=EVNT.root--jobConfig=<path_joboptions>
Gen_tf.py --ecmEnergy=13000. --maxEvents=20000 --firstEvent=1 --randomSeed=111 --outputEVNTFile=EVNT.root --jobConfig=<where>/joboption/100012/
```
5. Change .root type to [TruthAOD](https://twiki.cern.ch/twiki/bin/viewauth/AtlasProtected/TruthDAOD). We must creat a new screen to re-setup environment:
```
screen
setupATLAS
lsetup asetup
asetup 21.2.6.0,AthDerivation
cd <where>/run/10001x
Reco_tf.py --inputEVNTFile EVNT.root --outputDAODFile truth1.root --reductionConf TRUTH1
```
6. Create a new folder ntuple/100012 and download xAODDump to your ntuple folder:
```
/afs/cern.ch/work/y/yuxu/public/Zijun/xAODDump.tgz
/afs/cern.ch/work/y/yuxu/public/Zijun/setup_reco.sh
tar xf xAODDump.tgz
```
7. Copy/paste into ntuple/100012 folder:
```
cp <where>/
```
9. Go to a new screen and setup environment in


