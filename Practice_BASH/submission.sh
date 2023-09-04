universe = vanilla
executable =/afs/cern.ch/user/j/jtariq/Script/NNPDF-118z.sh
should_transfer_files = YES
transfer_input_files =/afs/cern.ch/user/j/jtariq/POWHEG-BOX-V2,/afs/cern.ch/user/j/jtariq/POWHEG-BOX-V2/Zorigional/pwhg_main,/afs/cern.ch/user/j/jtariq/Lhapdf6.3.0/share/LHAPDF,/afs/cern.ch/user/j/jtariq/Fastjet3.4.0/bin,/cvmfs/sft.cern.ch/lcg/views/LCG_99/x86_64-centos7-gcc8-opt/setup.sh
log =log/NNPDF31-118.log.$(cluster)
error = log/NNPDF31-118.error.$(cluster)-$(process)
output =log/NNPDF31-118.output.$(cluster)-$(process)
when_to_transfer_output = ON_EXIT
request_cpus   = 20
+jobflavour="testmatch"
notification = always
notify_user = junaid.tariq@cern.ch
queue 1


export LHAPDF_DATA_PATH=$LHAPDF_DATA_PATH:/afs/cern.ch/user/j/jtariq/Lhapdf6.3.0/share/LHAPDF
	export PATH=$PATH:/afs/cern.ch/user/j/jtariq/Lhapdf6.3.0/bin/

	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/afs/cern.ch/user/j/jtariq/Lhapdf6.3.0/lib


	export PATH=$PATH:/afs/cern.ch/j/jtariq/Fastjet3.4.0/bin/
	source /cvmfs/sft.cern.ch/lcg/views/LCG_99/x86_64-centos7-gcc8-opt/setup.sh