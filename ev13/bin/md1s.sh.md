mdCm bzw. md1-evv  <--->  dnts-pre-md1 converting lines ...
=====================================================================
exit 3

#####  ==========  sed replacements more:

    _______:  endFoldMark of _________...  to    ##______________... :
    find . -xdev  -type f  -name  '*.md'  -exec sed  -i.1sed  -e 's/^________________________________________  ___________________________/##&/'  {} \;
    find . -xdev -type f -iname '*1sed'  -exec rm {} \;

	_______:  again/nachträglich modifs/changings  , sed replacements ... for *.md additinal modifs...:
    find . -xdev  -type f  -name  '*.md'  -exec  sed  -i  -e "s/^\t____*: */\t${q_fold12Sm}/" {}  \;
    find . -xdev  -type f  -name  '*.md'  -exec  sed  -i  -e 's/^- --- */\t_____:  /'  {}  \;
    bin-txt:  sed -i -e 's/^##=========*/==========/' *txt

	_______:  sed replacements ... for xx_dnts.txt  --> xx_dnts.md : _____
	sed  -i.1sed  -e  '/^\s*$/d'  -e  "s/^======* */${q_fold1Em}\n\n\n${q_fold1Sm}/"  -e 's/^--- */\n\t_____:  /'   testingsQA_py.txt
	- older1:  sed  -i.1sed  -e  '/^\s*$/d'  -e  "s/^======* */${q_fold1Em}\n\n\n${q_fold1Sm}/"  -e 's/^--- */\n\/'   testingsQA_py.txt
	##--/OR explicit:
	sed ....  -e  's/^======* */________________________________________  ___________________________\n\n\n#####  ==========  /' ...   te1.md ;
	- then must check if deleting  emptylines was ok? and also dlete a few fold1-end-markers ! + indentation + listing-formating for md !
##________________________________________  ___________________________


#####  ==========  VIM-replacements-mdCm-tranfers:  xx_dnts.txt  --> xx_dnts.md /  mdCm format tranfer/...:

	_______:    fold1-markings-replacements/handle/...:  _____:
	- replace older fold-Start-markers to mdCm2-evv (variblae-names in :%s/.../ is obv. not possible!?):  
	execute '%substitute/' . "^==========*" . "/" . fold1Em . "^M^M" . fold1Sm . "/c"
	- replace older fold-end-markers to mdCm2-evv (variblae-names in :%s/.../ is obv. not possible!?):  
	execute '%substitute/' . "^_____________*" . "/" . fold1Em . "/"
	:%s/^__________*/________________________________________  ___________________________/
##________________________________________  ___________________________


#####  ==========  cmds:

	- cmark  --smart   --to html  --hardbreaks    f1.md  >|  f1.md.html
	- also:  cmark-gfm  ,  cmark-py3  ,  ...
##________________________________________  ___________________________
