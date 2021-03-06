#!/bin/sh

#$ -l h=!node23-5.wn.iihe.ac.be

export X509_USER_PROXY=/user/kskovpen/proxy/x509up_u20657

export LD_PRELOAD=/usr/lib64/libglobus_gssapi_gsi.so.4

WDIR=$(pwd)

line2=${line2}
fout=${fout}
isdata=${isdata}
noe=${noe}
xsec=${xsec}
eff=${eff}
nmax=${nmax}
sample=${sample}
doRW=${doRW}
doPU=${doPU}
doPS=${doPS}
tool=${tool}
dout=${dout}
samptype=${samptype}

export ROOTSYS=/cvmfs/cms.cern.ch/slc6_amd64_gcc530/lcg/root/6.06.00-ikhhed4
ls $ROOTSYS/bin/thisroot.sh
source $ROOTSYS/bin/thisroot.sh
rootV=$(root-config --version)
echo "ROOT v${rootV} has been set up"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${WDIR}

export LD_LIBRARY_PATH=\
/cvmfs/cms.cern.ch/slc6_amd64_gcc530/external/gcc/5.3.0/lib64:\
/usr/lib64:\
/cvmfs/cms.cern.ch/slc6_amd64_gcc530/external/gcc/5.3.0/lib:\
/cvmfs/cms.cern.ch/slc6_amd64_gcc530/cms/cmssw/CMSSW_8_0_12/external/slc6_amd64_gcc530/lib/:\
/cvmfs/cms.cern.ch/slc6_amd64_gcc530/cms/cmssw/CMSSW_8_0_12/lib/slc6_amd64_gcc530/:\
$LD_LIBRARY_PATH

export PATH=/cvmfs/cms.cern.ch/slc6_amd64_gcc530/external/gcc/5.3.0/bin:$PATH

echo "Executing .././LTAnalysis ${line2} ${dout}${fout} ${isdata} ${noe} ${xsec} ${eff} ${nmax} ${doRW} ${tool} ${samptype} ${doPU} ${doPS}"
${dout}/.././LTAnalysis ${line2} ${dout}${fout} ${isdata} ${noe} ${xsec} ${eff} ${nmax} ${doRW} ${tool} ${samptype} ${doPU} ${doPS}
