echo
echo
echo "***********POWHEG BOX V2****************"
echo
echo
echo "*******Production cross section for vector boson Z *******"
echo
echo
echo "******using NNPDF31-00108NNLO PDF SET*******"
echo
echo
echo
cd /home/junaid/POWHEG-BOX-V2/Z
currentdir=$PWD
inputname1=$1

cd /home/junaid/POWHEG-BOX-V2/Z/Zorigional/
Zorigional=$PWD
echo $PWD
cd ..
echo $PWD

if [ -f $inputname1 ]; then
    echo 'file' /$inputname1 'found'
    cd $currentdir/$inputname1/
else
    echo 'creating ' $currentdir/$inputname1
    mkdir -p $currentdir/$inputname1
    cd $currentdir/$inputname1/
fi
echo $PWD

echo "This set has 100 member PDFs. mem=0 --> central value; mem=1-100 --> eigenvector sets"
echo
echo
echo
echo "For central value set pdf index to 322500 and for eigenvectors set 322501-322599.  "
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
echo 'enter the pdf range '
echo
echo
read n


while [ $pdf -le $n ]; do

    if [ -f $pdf ]; then
        echo 'pdfset' $pdf 'found'
        cd $currentdir/$inputname1/$pdf/
    else
        echo 'creating directory' $PWD/$pdf
        echo "========>"$PWD
        mkdir -p $currentdir/$inputname1/$pdf
        cp -RT $Zorigional $currentdir/$inputname1/$pdf/
        echo "==========> "$PWD
        
    fi
    echo '=====>' $PWD

    #ls
    cd $currentdir/$inputname1/$pdf/testrun-lhc-8TeV
    #ls
    #echo $PWD
    sed -i -e '9,10 s/4000d0/6500d0/g' $PWD/powheg.input
    sed -i -e '12,13 s/21100/'$pdf'/g' $PWD/powheg.input
    #vim powheg.input
    echo
    echo
    echo
    echo
    echo

    cd $currentdir/$inputname1
    ((pdf = pdf + 1))
    #echo $pdf

done

echo "*************set the index from  where you want to calculate the cross section************ "
echo
echo
read pdfindex2
pdf2=$pdfindex2
echo
echo
echo "*************set the end of index upto you want to calculate the cross section***********"
echo
echo
echo
read pdfindex3
pdf3=$pdfindex3
pdf=$pdfindex2
#echo $pdf

while [ $pdf -le $pdf3 ]; do
    #echo $pdf
    #echo $pdf2
    #echo $pdf3

    cd $currentdir/$inputname1/$pdf/testrun-lhc-8TeV
     nohup ./../pwhg_main &
    #echo $PWD
    ((pdf = pdf + 1))
    echo $PWD
done
