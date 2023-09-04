 echo "***********POWHEG BOX V2****************"
echo
echo
echo "*******Production cross section for vector boson W+ and W-*******"
echo
echo
echo "******using NNPDF31-00118NNLO PDF SET*******"
echo
echo
cd /afs/cern.ch/user/j/jtariq
home=$PWD


inputname1=NNPDF31-118
inputname2=w+

cd /$home/POWHEG-BOX-V2/Worigional
Worigional=$PWD
echo $PWD
cd /$home/POWHEG-BOX-V2/W
wdir=$PWD 
echo '===>'$PWD

if [ -f $inputname1 ]; then
    cd $wdir/$inputname1/
    echo 'file' /$inputname1 'found'
else
    echo 'creating ' $wdir/$inputname1
    mkdir -p $wdir/$inputname1
    cd $wdir/$inputname1/

fi

echo $PWD


    if [ -f $inputname2 ]; then
        echo 'directory' $inputname2 'found'
        cd $PWD/$inputname2/
    else
        echo 'creating' $PWD/$inputname2
        mkdir -p $inputname2
    fi

    echo '===>'$PWD
    cd $wdir/$inputname1/$inputname2
    wp=$PWD
    echo '=====>'$PWD
    echo
    echo
    echo


    echo "This set has 100 member PDFs. mem=0 --> central value; mem=1-100 --> eigenvector sets"
    echo
    echo "For central value set pdf index to 324700 and for eigenvectors set 324701-324799.  "
    echo
    echo "!!!!!!!For w+ set idvecbos 24  and for W- set idvecbos -24 "
    echo
    
    echo
    echo
    pdfindex=324700
    echo
    echo
   
    echo
    echo
    n=324799
    echo
    
    while [ $pdfindex -le $n ]; do
        if [ -f $pdfindex ]; then
            echo 'pdfset' $pdfindex 'found'
            cd $wp/$pdf/
        else
            echo 'creating directory' $wp/$pdfindex
            mkdir -p $wp/$pdfindex
            cp -RT $Worigional $wp/$pdfindex/
            cd $wp/$pdfindex/
        fi

        #echo '=========>>'$PWD
        cd $wp/$pdfindex/testrun-wm-lhc-8TeV
        #echo '========>>>>>'$PWD
        #ls
        sed -i -e '2 s/-24/24/g' $wp/$pdfindex/testrun-wm-lhc-8TeV/powheg.input
        sed -i -e '10,11 s/4000d0/6500d0/g' $wp/$pdfindex/testrun-wm-lhc-8TeV/powheg.input
        sed -i -e '13,14 s/21100/'$pdf'/g' $wp/$pdfindex/testrun-wm-lhc-8TeV/powheg.input
        #vim powheg.input
        #nohup ./../pwhg_main &
        cd $wp
        ((pdfindex = pdfindex + 1))

    done
    
    


  #Executable = /afs/cern.ch/work/w/wajid/topMC/testing/test/MEPS/script.sh
 #Universe = vanilla
  #should_transfer_files = YES
  #transfer_input_files = /afs/cern.ch/work/w/wajid/topMC/testing/test/MEPS/Hadronizer-fragment.py,/afs/cern.ch/work/w/wajid/topMC/testing/test/MEPS/cgbh_H_M400_rhott04_rhotc04_rhotu00_slc7_amd64_gcc700_CMSSW_10_6_19_tarball.tar.xz
  #request_cpus=8
  #when_to_transfer_output = ON_EXIT
  #Error = log/job_$(Cluster)-$(Process).err
  #Output = log/job_$(Cluster)-$(Process).out
  #Log = log/job_$(Cluster)-$(Process).log
  #+JobFlavour= "nextweek"
  #notification = Always
  #notify_user = wajid@cern.ch
  #Queue 1

