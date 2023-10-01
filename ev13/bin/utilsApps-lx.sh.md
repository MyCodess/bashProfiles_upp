__________________  utils-lx.sh.txt : ________________________________________
exit 3
##________________________________________  ___________________________


#####  ==========  pdf-utils /cmds-qcks :

	_______:  converting PDFs to images,...:
	- unoconv (from LibreOffice):  unoconv -f pdf myfile1  ; unoconv - convert any document from and to any LibreOffice supported format
	- pdftoppm   sep1.pdf   sep1.pnd  -png
	- converting PDF to images:   convert sep1.pdf  -resize 100%  sep1.jpg  ##-- /or any other image as png/gif/...;  convert  program  is  a  member of the ImageMagick(1) suite of tools !
	-  also with LibreOffice can do anything ....; choose by export the file-type,...; or insert images into PDF by Menu-insetrt-image ...

	_______:  PDF extract+merge (if pdftk not working) :   pdfseparate ct.18.15.pdf -f 116 -l 119 aa-%d.pdf ; pdfunite  aa-*.pdf  ct.18.15--116-119.pdf ; rm aa-*pdf ;

	_______:  !! pdftk:  see extra nts: .../0devNts/lxOSs/utils_audioVideo_apps_SWs_lx/pdftk_nts.txt
	-!!error-problem:  Error: Unable to find file. 
		with-snap-install-on-ubuntu-18.04 : - 200115    :  pdftk problem, which leider musste install by snap : sudo snap install pdftk ; but permissions problems! so I had to wrkaround:  sudo ln -s /snap/pdftk/current/usr/bin/pdftk /usr/bin/pdftk  ; !!  is not pdftk-problem, but ubuntu-snap-problem !! see https://wilransz.com/pdftk-on-ubuntu-18-04/  ...
		!! and then you MUST call it by the link:  /usr/bin/pdftk  .... ! otherwise it still execute the snap-version!! which is earlier in $PATH !!
	#-hier CP-quickies:
	- extracting pages 3-5 to a new file:  pdftk foo.pdf  cat 3-5 output ../out1.pdf
	- merging files:  pdftk f1.pdf f2.pdf  cat output  out1.pdf
	- merging-pageweise of several files:  pdftk A=one.pdf B=two.pdf cat A1-7 B1-5 A8 output combined.pdf
	-  Remove page 13 from in1.pdf to create out1.pdf :    pdftk in.pdf cat 1-12 14-end output out1.pdf   ##--from  man pdftk

	_______:  size-reducing of PDFs with ghostscript/gs cmd / optimization :
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf  ##-Here, replace output.pdf and input.pdf according
	/OR:  ps2pdf -dPDFSETTINGS=/ebook input.pdf output.pdf
	-- qualities/size variations:
	-dPDFSETTINGS Option    Description
	-dPDFSETTINGS=/screen   Has a lower quality and smaller size. (72 dpi)
	-dPDFSETTINGS=/ebook    Has a better quality, but has a slightly larger size (150 dpi)
	-dPDFSETTINGS=/prepress Output is of a higher size and quality (300 dpi)
	-dPDFSETTINGS=/printer  Output is of a printer type quality (300 dpi)
	-dPDFSETTINGS=/default  Selects the output which is useful for multiple purposes. Can cause large PDFS.
	https://www.journaldev.com/34668/reduce-pdf-file-size-in-linux :
	sudo apt install ghostscript
	You can use this magic command to compress PDFs to a readable quality!
	--
	or if installed pdfopt , then:    pdfopt file1.pdf  output.pdf    #/OR directely with ghostscript:
##________________________________________  ___________________________


#####  ==========  Fotos/Images/Graphics-editing, resizing, converting, ...:
	- see ImageMagick + exactimage in devnts !
	-!! see http://mirror.checkdomain.de/imagemagick/www/command-line-tools.html
	-! see rpm -ql ImageMagick  bzw. alle his family: rpmssg ImageMagick , ... ;   http://www.imagemagick.org/
	- resize fotos/images to 20% : mkdir ./resized20p  ;  for ii in *.JPG; do convert "$ii"  -resize 20%   "./resized20p/$ii" ; done
	- resize fotos/images to 20%  and rotate to left (-90 Grad): mkdir ./resized20p_lroate  ;  for ii in *.JPG; do convert "$ii"  -resize 20%  -rotate -90  "./resized20p_lroate/$ii" ; done
##________________________________________  ___________________________


#####  ==========  antiVirs:
	clamscan -v -r --bell --move=/tmp/avs Duden_30
##________________________________________  ___________________________


#####  ==========  Wetter/Weather by wttr.in ,so text-based-wether-forcast:

	_______:  wttr.in  , see also /up1/w/docs_m/dres/devnts/utils_apps/ :
	curl wttr.in/Berlin
	curl wttr.in/Berlin?lang=en            ##-- ?lang=de
	curl wttr.in/:help
	curl wttr.in//:bash.function
	curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Berlin}"

	_______:  
	elinks  http://www.wetter.com/wetter_aktuell/wettervorhersage/3_tagesvorhersage/deutschland/berlin/kga_sonnenschein/DE0001020173.html   ##--KGA-Sonn-3Tage
##________________________________________  ___________________________


#####  ==========  xxx:
##________________________________________  ___________________________


#####  ==========  xxx:
##________________________________________  ___________________________


#####  ==========  xxx:
##________________________________________  ___________________________


#####  ==========  xxx:
##________________________________________  ___________________________

