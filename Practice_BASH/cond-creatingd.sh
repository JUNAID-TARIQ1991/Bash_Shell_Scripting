#!/bin/bash
echo "***********POWHEG BOX V2****************"

#echo
echo
echo "*******Production cross section for vector boson Z *******"
echo
echo
echo "******using NNPDF31-00118NNLO PDF SET*******"
echo

cd /afs/cern.ch/user/j/jtariq/

home=$PWD


inputname1=NNPDF31-118


cd /$home/POWHEG-BOX-V2/Zorigional
Zorigional=$PWD
echo $PWD
cd /$home/POWHEG-BOX-V2/Z 
zdir=$PWD

if [ -f $inputname1 ]; then
    cd $zdir/$inputname1/
    echo 'file' /$inputname1 'found'
else
    echo 'creating ' $zdir/$inputname1
    mkdir -p $zdir/$inputname1
    cd $zdir/$inputname1/

fi

echo $PWD


   
    echo
    echo
    echo


    #echo "This set has 100 member PDFs. mem=0 --> central value; mem=1-100 --> eigenvector sets"
    #echo
    #echo "For central value set pdf index to 324700 and for eigenvectors set 324701-324799.  "
    echo
    
    echo
    
    echo
    echo
    pdfindex=324700
    echo
    echo
   
    echo
    echo
    n=324701
    echo
    
    while [ $pdfindex -le $n ]; do
        if [ -f $pdfindex ]; then
            echo 'pdfset' $pdfindex 'found'
            cd $zdir/$inputname1/$pdfindex
        else
            echo 'creating directory' $zdir/$inputname1/$pdfindex
            mkdir -p $zdir/$inputname1/$pdfindex
            cp -RT $Zorigional $zdir/$inputname1/$pdfindex/
            cd $zdir/$inputname1/$pdfindex
        fi

        #echo '=========>>'$PWD
        cd $zdir/$inputname1/$pdfindex/testrun-lhc-8TeV

        #echo '========>>>>>'$PWD
        #ls
        #sed -i -e '2 s/-24/24/g' $wm/$pdfindex/testrun-wm-lhc-8TeV/powheg.input
        sed -i -e '09,10 s/4000d0/6500d0/g' $zdir/$inputname1/$pdfindex/testrun-lhc-8TeV/powheg.input
        sed -i -e '12,13 s/21100/'$pdfindex'/g' $zdir/$inputname1/$pdfindex/testrun-lhc-8TeV/powheg.input
        #vim powheg.input
         nohup vim  $pdfindex.sub &
         
         echo "universe = vanilla" >> $pdfindex.sub
         echo "executable = /afs/cern.ch/user/j/jtariq/POWHEG-BOX-V2/Z/$inputname1/$pdfindex/testrun-lhc-8TeV/./../pwhg_main" >> $pdfindex.sub
         echo "log =log/$pdfindex.log.\$(cluster)" >> $pdfindex.sub
         echo "error = log/$pdfindex.error.\$(cluster)-\$(process)" >> $pdfindex.sub
         echo "output =log/$pdfindex.output.\$(cluster)-\$(process)" >> $pdfindex.sub
         echo "When_to_transfer_output = ON_EXIT" >>$pdfindex.sub
         echo "request_cpus   = 20" >> $pdfindex.sub
         echo "+jobflavour="tomorrow"" >>$pdfindex.sub
         echo "notification = always" >> $pdfindex.sub
         echo "notify_user = junaid.tariq@cern.ch" >>$pdfindex.sub
         echo "should_transfer_files = YES" >>$pdfindex.sub
         echo "transfer_input_files =$zdir/$inputname1/$pdfindex/testrun-lhc-8TeV/powheg.input, $Zorigional/pwhg_main " >> $pdfindex.sub
         echo "queue 1" >> $pdfindex.sub
    




     ((pdfindex = pdfindex + 1))
        cd $zdir/$inputname1

    done