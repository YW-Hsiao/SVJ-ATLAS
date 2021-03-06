# SVJ-ATLAS
Abstract: This repository is about JobOptions process and Semi-Visible Jets simulations.


## 1. JobOptions Process
1. Sign-in your LXPLUS
2. And then we need a environment to work in 24 hours. Therefore, go into LXPLUS screen:
```
k5reauth -x -f pagsh
aklog
bash
screen
```
3. First, setup your JO.py file and put the JO.py file in a folder, such as joboptions/100012/JO1.py, joboptions/100013/JO2.py, and so on (or jo100012/JO1.py). &#128314; Notice: Only one JO file in each folder. &#128315;
Similarly, create another folder for running the JO generation process, such as run/100012, run/100013, and so on (or run100012).
4. Setup environment, go into the run folder, and run MadGraph & Pythia & detector simulation:
```
setupATLAS
asetup 21.6.51,AthGeneration (blacklisted)
asetup 21.6.58,AthGeneration
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
We will get the file `DAOD_TRUTH1.truth1.root`.  
6. Create a new folder `ntuple/100012` and download `xAODDump` to your `ntuple` folder:
```
/afs/cern.ch/work/y/yuxu/public/Zijun/xAODDump.tgz
/afs/cern.ch/work/y/yuxu/public/Zijun/setup_reco.sh
tar xf xAODDump.tgz
```
7. Copy/paste the `DAOD_TRUTH1.truth1.root` into ntuple/100012 folder:
```
cp <where>/DAOD_TRUTH1.truth1.root <where>/ntuple/100012
```
8. Go to a new screen and setup environment in `<where>/ntuple`:
```
screen
cd <where>/ntuple
setupATLAS
lsetup asetup
rcSetup Base,2.3.23
rc find_packages
rc compile
```
9. Go into `/ntuple/100012`:  
&#128314; Notice: Only one file which is `DAOD_TRUTH1.truth1.root` in folder and the total number of event. &#128315;
```
cd <where>/ntuple/100012
UserTuple 0 run . ntuple 20000
```
10. We will obtain a run folder and go into `run/data-user` there is a `ntuple.root` root file. Check it out:
```
cd <where>/100012/run/data-user
root -l ntuple.root
.ls
```
We are going to see `tau;1`, so that we successfully done.
```
.q
```

### Useful command
```
control+a+d
screen -list
screen -r
ssh <yourname>@lxplusXXX.cern.ch
```

## 2.Semi-Visible Jets Simulation
### 2-1. Version
* R525 CPU server:
    -- | MadGraph5 | PYTHIA | DELPHES | HepMC | LHAPDF | FastJet
    -- | :-------: | :----: | :-----: | :---: | :----: | :-----:
    Version | 2.7.3 | 8.245 | 3.4.2 | 
    
* JobOption:
    -- | MadGraph5 | PYTHIA | DELPHES | HepMC | LHAPDF | FastJet
    -- | :-------: | :----: | :-----: | :---: | :----: | :-----:
    Version | 2.7.3 | 8.244 | 3.4.2 | 



### 2-2. t-channel with CKKW-L
1. For R525 CPU server:

t-channel (CKKW-L) | X-section (MG)/Nevent| X-section (Pythia) | Total/Accepted Nevent | Remark
------------------ | :--------------------: | :----------------: | :-------------------: | :----:
t-ch_ckkwl-v1      | 62.99 +- 0.1111 pb/10000 | 6.391e-08 mb | 10000/9998 | xqcut 30.0
hepmc-2 |    | 6.392e-08 mb | 10000/9999 |
t-ch_ckkwl-v2      | 63.09 +- 0.08374 pb/30000 |    |    | Increase Nevent, decrease sigma
t-ch_ckkwl-v3      | 63.04 +- 0.1112 pb/10000 | 6.398e-08 mb | 10000/9998 | xqcut 0.0/doPTLundMerging = on
hepmc-2 |    | 6.400e-08 mb | 10000/9999 | doKTMerging = on
hepmc-3 |    | 6.315e-08 mb | 10000/9841 | doKTMerging = on/close: ...
hepmc-4 |    | 6.296e-08 mb | 10000/9820 | doKTMerging = on
t-ch_ckkwl-v4      | 53.52 +- 0.1007 pb/10000 | 5.398e-08 mb | 10000/9965 | xqcut 200.0
t-ch_ckkwl-v5      | 42.33 +- 0.08993 pb/10000 |    |    | xqcut 0.0/ktdurham 300



2. For JO:

t-channel (CKKW-L) | X-section (MG)/Nevent| X-section (Pythia) | Total/Accepted Nevent | Remark
------------------ | :--------------------: | :----------------: | :-------------------: | :----:
t-ch_ckkwl-iSeed1




### 2-3. s-channel with CKKW-L
* == means it is the same above.
* -- means there is no do it.

<table>
    <tr>
        <th colspan="2">s-ch. (CKKW-L)</th>
        <th>MG Setting</th>
        <th>X-section (MG)</th>
        <th>Pythia Setting</th>
        <th>X-section (Pythia)/Accepted</th>
    </tr>
    <tr>
        <th colspan="2">s-ch_ckkwl-v0</th>
        <td>nevents 20000, ECM=14 TeV,<br>xqcut 0.0, ktdurham 100</td>
        <td>0.6776+-0.001049 pb</td>
        <td>NA</td>
        <td>NA</td>
    </tr>
    <tr>
        <th rowspan="3">s-ch_ckkwl-v1</th>
        <td>svj_ckkwl-1</td>
        <td rowspan="3">nevents 10000, ECM=13 TeV,<br>xqcut 0.0, ktdurham 100</td>
        <td rowspan="3">0.5557+-0.001356 pb</td>
        <td>doKTMerging=on, Process=pp>xdxd~</td>
        <td>1.000e-04+-5.689e-06 mb/291</td>
    </tr>
    <tr>
        <td>DP8</td>
        <td>doKTMerging=on, Process=pp>xdxd~</td>
        <td>5.263e-10 mb/9471</td>
    </tr>
    <tr>
        <td>svj_ckkwl-2</td>
        <td>doKTMerging=on, Process=pp>xdxd~,<br>nSubruns=1, subrun=0</td>
        <td>1.000e-04+-5.710e-06 mb/289</td>
    </tr>
    <tr>
        <th>s-ch_ckkwl-v1-1</th>
        <td>svj_ckkwl-1</td>
        <td>nevents 10000, ECM=13 TeV,<br>xqcut 0.0, ktdurham 100, auto_ptj_mjj=False</td>
        <td>0.5557+-0.001356 pb</td>
        <td>doKTMerging=on, Process=pp>xdxd~</td>
        <td>1.000e-04+-5.689e-06 mb/291</td>
    </tr>
    <tr>
        <th>s-ch_ckkwl-v1-2</th>
        <td>svj_ckkwl-1</td>
        <td>nevents 10000, ECM=13 TeV,<br>xqcut 0.0, ktdurham 100, dokt=True;<br>But .lhe do NOT find dokt</td>
        <td>0.5557+-0.001356 pb</td>
        <td>???</td>
        <td>???</td>
    </tr>
    <tr>
        <th rowspan="3">s-ch_ckkwl-v2</th>
        <td>svj_ckkwl-1</td>
        <td rowspan="3">nevents 10000, ECM=13 TeV,<br>xqcut 0.0, <strong>ktdurham 20</strong></td>
        <td rowspan="3">0.9354+-0.002447 pb</td>
        <td>doKTMerging=on, Process=pp>xdxd~</td>
        <td>1.000e-04+-7.515e-06 mb/171</td>
    </tr>
    <tr>
        <td>svj_ckkwl-2</td>
        <td>???</td>
        <td>9.307e-10 mb/<strong>7343</strong></td>
    </tr>
    <tr>
        <td>svj_ckkwl-3</td>
        <td>???</td>
        <td>9.233e-10 mb/9863</td>
    </tr>
</table>


<td></td>
<strong></strong>




#### Conclusion:
1. s-ch_ckkwl-v0: Use previous setting which is s-channel with MLM jet matching.
2. s-ch_ckkwl-v1: main89 and DelphesPythia8 have different results.
    +LHEFInputs:nSubruns = 1 and Main:subrun = 0, the X-section has a little bit different.
    v1-1: +auto_ptj_mjj = False, I guess we need to use Merging:doPTLundMerging = on.
    v1-2: I do NOT find dokt setting in .lhe file.
3. 




#### Figure out:
* doKTMerging:
* TMS:
* mayRemoveDecayProducts:
* 
