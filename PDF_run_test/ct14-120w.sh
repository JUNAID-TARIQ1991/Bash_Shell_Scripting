echo "***********POWHEG BOX V2****************"
echo 
echo 
echo "*******Production cross section for vector boson W+ and W-*******"
echo
echo 
echo "******using CT14NNLO-0120 PDF SET*******"
echo 
echo 
 cd /home/junaid/POWHEG-BOX-V2/W/
scriptname=$0
inputname1=$1
inputname2=$2
currentdir=$PWD
cd /home/junaid/POWHEG-BOX-V2/W/WOrigional/
WOrigional=$PWD
echo $PWD
cd ..
echo '===>'$PWD
if [ -f $inputname1 ]
cd $currentdir/$inputname1/

then
echo 'file' /$inputname1 'found'
else
echo 'creating ' $currentdir/$inputname1
mkdir -p $currentdir/$inputname1
cd $currentdir/$inputname1/
    
fi
                                                                                                                                                                                                       


echo $PWD

vboson=$inputname2
case $vboson in
    "w+" )
if [ -f $inputname2 ]
then 
    echo 'directory' $inputname2 'found'
    cd $PWD/$inputname2/
else
    echo 'creating' $PWD/$inputname2
    mkdir -p $inputname2
fi

    echo '===>'$PWD
    cd $currentdir/$inputname1/$inputname2
    wp=$PWD
    echo '=====>'$PWD



echo "This set has 1 member PDFs. mem=0 --> central value; "
echo 
echo "For central value set pdf index to 13069.  "
echo
echo "!!!!!!!For w+ set idvecbos 24  and for W- set idvecbos -24 "
echo
echo "***********************set the pdf index************************"
echo
echo
echo
read pdfindex
pdf=$pdfindex
if [ -f $pdf ] 
then
    echo 'pdfset' $pdf 'found'
    cd $wp/$pdf/
else
    echo 'creating directory' $wp/$pdf
    mkdir -p $wp/$pdf
    cp -RT $WOrigional $wp/$pdf/
    cd $wp/$pdf/
fi


echo '=========>>'$PWD
cd $wp/$pdf/testrun-wm-lhc-8TeV
echo '========>>>>>'$PWD
ls
sed -i -e '2 s/-24/24/g' $wp/$pdf/testrun-wm-lhc-8TeV/powheg.input
sed -i -e '10,11 s/4000d0/6500d0/g' $wp/$pdf/testrun-wm-lhc-8TeV/powheg.input
sed -i -e '13,14 s/21100/'$pdf'/g'  $wp/$pdf/testrun-wm-lhc-8TeV/powheg.input
vim powheg.input
read -r -p "are you sure to execute ./..pwhg_main? [Y/N]" response
case "$response" in
[yY][eE][sS]|[yY] )
./../pwhg_main
;;
[nN][oO] | [nN] )
echo 'exiting'
;;
* )
echo 'invalid response'
;;
esac








    


;;
"w-" )

if [ -f $inputname2 ]
    then 
    echo 'directory' $inputname2 'found'
    cd $PWD/$inputname2/
else
    echo 'creating' $PWD/$inputname2
    mkdir -p $inputname2
    cd $PWD/$inputname2
fi

    echo '===>'$PWD
   
    wm=$PWD
    echo '=====>'$PWD




echo "This set has 1 member PDFs. mem=0 --> central value;"
echo 
echo "For central value set pdf index to 13069.  "
echo
echo "!!!!!!!For w+ set idvecbos 24  and for W- set idvecbos -24 "
echo
echo "***********************set the pdf index************************"
echo
echo
echo
read pdfindex
pdf=$pdfindex
if [ -f $pdf ] 
then
    echo 'pdfset' $pdf 'found'
    cd $wm/$pdf/
else
    echo 'creating directory' $wm/$pdf
    mkdir -p $wm/$pdf
cp -RT $WOrigional $wm/$pdf/
cd $wm/$pdf/
fi
echo '=========>>'$PWD
cd $wm/$pdf/testrun-wm-lhc-8TeV
echo '========>>>>>'$PWD
ls
#sed -i -e '2 s/-24/24/g' $wp/$pdf/testrun-wm-lhc-8TeV/powheg.input
sed -i -e '10,11 s/4000d0/6500d0/g' $wm/$pdf/testrun-wm-lhc-8TeV/powheg.input
sed -i -e '13,14 s/21100/'$pdf'/g'  $wm/$pdf/testrun-wm-lhc-8TeV/powheg.input
vim powheg.input
read -r -p "are you sure to execute ./..pwhg_main? [Y/N]" response
case "$response" in
[yY][eE][sS]|[yY] )
./../pwhg_main
;;
[nN][oO] | [nN] )
echo 'exiting'
;;
* )
echo 'invalid response'
;;
esac



 
;;

* ) echo "invalid input"
;;
esac

 













