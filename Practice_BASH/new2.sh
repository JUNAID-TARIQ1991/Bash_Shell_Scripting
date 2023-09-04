




        pdfindex = 322500
        nohup vim  $pdfindex.sub &

        echo "$cluster" 
         echo "universe = vanilla" >> $pdfindex.sub
         echo "executable = /afs/cern.ch/user/j/jtariq/POWHEG-BOX-V2/Z/$inputname1/$pdfindex/testrun-lhc-8TeV/./../pwhg_main" >> $pdfindex.sub
         echo "log =log/$pdfindex.log.\$(cluster) " >> $pdfindex.sub
         echo "error = log/$pdfindex.error.\$(cluster)-\$(process)" >> $pdfindex.sub
         echo "output =log/$pdfindex.output.\$(cluster)-\$(process) " >> $pdfindex.sub
         echo "When_to_transfer_output = ON_EXIT" >>$pdfindex.sub
         echo "request_cpus   = 20" >> $pdfindex.sub
         echo "+jobflavour="tomorrow"" >>$pdfindex.sub
         echo "notification = always" >> $pdfindex.sub
         echo "notify_user = junaid.tariq@cern.ch" >>$pdfindex.sub
         echo "should_transfer_files = YES" >>$pdfindex.sub
         echo "transfer_input_files =$zdir/$inputname1/$pdfindex/testrun-lhc-8TeV/powheg.input,$zorigional/pwhg_main " >> $pdfindex.sub
         echo "queue 1" >> $pdfindex.sub