echo
echo
echo "***********POWHEG BOX V2****************"
echo 
echo 
echo "*******Production cross section for vector boson Z *******"
echo
echo 
echo "******using HERA20-VAR PDF SET*******"
echo 
echo 
echo 
cd /home/junaid/POWHEG-BOX-V2/Z
inputname1=$1

currentdir=$PWD
cd /home/junaid/POWHEG-BOX-V2/Z/Zorigional/
Zorigional=$PWD
echo $PWD
cd ..
echo $PWD

if [ -f $inputname1 ]
    

then
cd $currentdir/$inputname1/
echo 'file' /$inputname1 'found'
else
    echo 'creating ' $currentdir/$inputname1
    mkdir -p $currentdir/$inputname1
    cd $currentdir/$inputname1/
    
fi
echo $PWD


echo "This set has 14 member PDFs. mem=0 --> central value; mem=1-13 --> eigenvector sets"
echo
echo 
echo
echo "For central value set pdf index to 61230 and for eigenvectors set 61231-61243.  "
echo
echo
echo
echo "***********************set the pdf index************************"
echo
echo
echo
echo
read pdfindex
pdf=$pdfindex
echo
echo
echo "******************set the pdf range******************"
echo
echo
read n 

while [ $pdf -le $n ] 
do
    echo $pdf
    if [ -f $pdf ] 
        then
            echo 'pdfset' $pdf 'found'
            cd $PWD/$pdf/
    else
    echo 'creating directory' $PWD/$pdf
    mkdir -p $PWD/$pdf
    cp -RT $Zorigional $currentdir/$inputname1/$pdf/
    cd $currentdir/$inputname1
    fi
    echo '=====>' $PWD

    #ls

    cd $PWD/$pdf/testrun-lhc-8TeV
    #ls
    sed -i -e '9,10 s/4000d0/6500d0/g' $PWD/powheg.input
    sed -i -e '12,13 s/21100/'$pdf'/g'  $PWD/powheg.input
    #vim powheg.input
    echo
    echo
    echo
    echo
    echo

    ./../pwhg_main
    cd $currentdir/$inputname1
    ((pdf=pdf+1 ))
    echo $pdf  
    

done
