#!/bin/bash -il
#
##-- HardWare-Infos-logging-of-NBs-PCs-...
usage11="sudo $0  <device-tag-evv1> "  ##--eg $0  Lv13
device11=${1:?"${usage11}"}

##-------- generate HardWare-log-files for the device11 
##-- USAGE HWlogGen1  <device-tag-evv1>  <cmd>  <cmd-params>
HWlogGen1(){
	echo "____$1--$2--$3______"
	device11="$1"
	cmd11="$2"
	cmd11Params="$3"
	FN11="$($cuds)-${cmd11}-${device11}-${q_syysTg}.log"
	##-- with params:
	el1d      "${cmd11}---${cmd11Params}"   >>  ./${FN11}
	${cmd11}             "${cmd11Params}"   >>  ./${FN11}
	el1de     "${cmd11}---${cmd11Params}"   >>  ./${FN11}
	##-- NO params:
	el1d      "${cmd11}"                    >>  ./${FN11}
	${cmd11}                                >>  ./${FN11}
	el1de     "${cmd11}"                    >>  ./${FN11}
}

HWlogGen1  "${device11}"  hwinfo  "--short"
HWlogGen1  "${device11}"  lshw    "-short"
HWlogGen1  "${device11}"  inxi    "--basic"
HWlogGen1  "${device11}"  lspci   "-v"
HWlogGen1  "${device11}"  lsusb   "-v"
HWlogGen1  "${device11}"  dmidecode   "--quiet"

