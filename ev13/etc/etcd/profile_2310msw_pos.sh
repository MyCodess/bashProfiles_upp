##__  #!/bin/bash
set -a
q_pls1  "${BASH_SOURCE[0]##*/}"         ##--prev:  export myname11="${BASH_SOURCE[0]##*/}" ; psl  "$myname11" ;

#--??  q_syysTgL1=${q_hostTg}
#--??  q_syysTgL2=${q_syysTgL1}_${q_osRelTg}


#####  ==========  NWs-PCs-Servers-Infrastruc...-prj:
##-- proxys-settings without "http:..." ; eg: MSYS2 itself, pacman or python .. in msys2 do NOT work if http://.... format !
export q_ofc1_proxy1='zscaler-prod.fs01.vwf.vwfs-ad:8080'
alias  curl1="curl  -x $q_ofc1_proxy1"
setProxysOfc1() { 
	##--II-  echo "setting-Int-Proxys, BUT: not-100%-correct:  MUST exclude local+intranets-servers, so use it just in a temporary-terminal!"
	##--1OK-for-mswins:  export  HTTPS_PROXY='zscaler-prod.fs01.vwf.vwfs-ad:8080' ; export  HTTP_PROXY='zscaler-prod.fs01.vwf.vwfs-ad:8080' ;
	export  https_proxy="${q_ofc1_proxy1}" ; export  http_proxy="${https_proxy}"
	export  no_proxy=localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,10.34.169.194/8
	export  HTTPS_PROXY="$https_proxy"  HTTP_PROXY="$http_proxy"  NO_PROXY="$no_proxy"
	expg    prox ;  ##--echo $https_proxy  $http_proxy
}  ##--2do--not-100%-correct:  MUST exclude local+intranets-servers, so use it just in a temporary-terminal!

##-- the same as above,  butt with HTTP://.../ protocol format ! (some apps require this, so incl. http[s]:// ... :)
setProxysOfc1Http() { 
	##--II-  echo "setting-Int-Proxys, BUT: not-100%-correct:  MUST exclude local+intranets-servers, so use it just in a temporary-terminal!"
	##--1OK-for-mswins:  export  HTTPS_PROXY='zscaler-prod.fs01.vwf.vwfs-ad:8080' ; export  HTTP_PROXY='zscaler-prod.fs01.vwf.vwfs-ad:8080' ;
	##--1OK_b: export  https_proxy='https://zscaler-prod.fs01.vwf.vwfs-ad:8080/' ; export  http_proxy='http://zscaler-prod.fs01.vwf.vwfs-ad:8080/' ;
	export  https_proxy="https://${q_ofc1_proxy1}/" ; export  http_proxy="http://${q_ofc1_proxy1}/"
	export  no_proxy=localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,10.34.169.194/8
	export  HTTPS_PROXY="$https_proxy"  HTTP_PROXY="$http_proxy"  NO_PROXY="$no_proxy"
	expg    prox ;  ##--echo $https_proxy  $http_proxy
}  ##--2do--not-100%-correct:  MUST exclude local+intranets-servers, so use it just in a temporary-terminal!
###________________________________________  ___________________________

q_ple1  "${BASH_SOURCE[0]##*/}"
