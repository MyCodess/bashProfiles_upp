#!/bin/bash

set -u -e

USAGE1="USAGE:  ${0##*/} <old-vorlage-devnts-prj-tag>  <new-devnts-prj-tag>  ; eg ${0##*/}  pl  py"
export  oldtag="${1:?$USAGE1}"
export  newtag="${2:?$USAGE1}"

echo "====== building new devnts/${newtag}  tree  based on devnts/${newtag}"

cd wks && mkdir -p devnts/${newtag} &&  cd devnts/${newtag} && mkdir wp_${newtag}

touch $(cd /up1/w/docs_m/dres/devnts/${oldtag}/ && find | sed -e "s@${oldtag}@${newtag}@gi")
ls -la

