#!/bin/bash
echo
echo
echo "************coss-section using NPDF 31-118 for wplus boson ****************"
echo
echo
cd /afs/cern.ch/user/j/jtariq
home=$PWD

inputname1=NNPDF31-118
cd $home/POWHEG-BOX-V2/W/$inputname1/w-
wm =$PWD
cd $home/Script
echo "******start index**********"

read startindex
start =$startindex
echo "******end index*******"
read endindex
end =$endindex

while [ $start -le $end ]; do

    if [ -f wminusout]; then
        cd wminusout
    else
        mkdir -p wminusout
        cd wminusout

    fi

    mkdir $start
    cd start
    cp $wm/$start/testrun-lhc-8TeV/pwg-stat.dat $home/Script/wplusout/$start
    cd ..
    ((start = start + 1))
done
