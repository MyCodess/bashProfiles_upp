##__  #!/bin/bash
set -a
q_pls1  "${BASH_SOURCE[0]##*/}"         ##--prev:  export myname11="${BASH_SOURCE[0]##*/}" ; psl  "$myname11" ;

#####  ==========  ofc1pc1-addies/settings:
setProxysOfc1() { 
	echo "setting-Int-Proxys, BUT: not-100%-correct:  MUST exclude local+intranets-servers, so use it just in a temporary-terminal!"
	export  HTTPS_PROXY='zscaler-prod.fs01.vwf.vwfs-ad:8080' ; export  HTTP_PROXY='zscaler-prod.fs01.vwf.vwfs-ad:8080' ;
	echo $HTTPS_PROXY  $HTTP_PROXY
}  ##--2do--not-100%-correct:  MUST exclude local+intranets-servers, so use it just in a temporary-terminal!


q_ple1  "${BASH_SOURCE[0]##*/}"
