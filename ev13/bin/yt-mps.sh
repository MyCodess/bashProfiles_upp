#!/bin/bash

##--II-for simulating/not-downloading do "youtube-dl -s ..." !! additionaly with "youtube-dl -s --get-filename " it print the final filename but not saving/DW anything ! 
##-- so for dry/simulate do :  youtube-dl  -s  --get-filename  ...
##-- PLs: for playlists just give the full URL of any song in the PL, inkl. list=xxx,  it should then download all and says at the beginning how many ..., ! add logfile for PL-dw with:  -o "$($cudts)_dw.log"
##-- YPL-url-eg:   https://www.youtube.com/playlist?list=OLAK5uy_kZZfej4CiY8TviavTohNwUdnRlD_rhNPM
##-- logfile for PLs:  just add to cmdLine:   ...   2>&1     | tee -a  "$($cudts)_dw.log"

myFN1=${0##*/}
URL1="${1:?$ERROR-missing-URL, USAGE1:  ${myFN1}  <URl-to-dw> }"
yt_DW_archHistLog_FP="${mpswpDP}/hist1_YT_MPs.log"    ##--I-/_230129: seperating videos/VPs-and-audios/MPs-arc-file!  archive-history-central-logfile to avoid re-downloading, to remember downloaded-hist !

##--??-chk/expremintel:  --all-subs ,
##__  youtube-dl  \
yt-dlp  \
	-f 'bestaudio'   --keep-video \
	--download-archive "${yt_DW_archHistLog_FP}"  \
	--write-description --write-info-json  -iwc  --no-color  --restrict-filenames  --geo-bypass  --all-subs \
	--extract-audio  --audio-quality 0  \
	-o  '%(artist)s---%(track)s/%(artist)s---%(track)s__Y%(release_year)04d__tgID1_%(id)s.%(ext)s'    "$*"      ##--II-single-songs-DW

exit 0
echo "___________ you may NOT have  seen this line!! PROBLEM if you see this !!! ____________"


##========== more one-liners-to-use/coll ...:
##__   -o  '%(artist)s---%(title)s/%(artist)s---%(track)s__Y%(release_year)04d__tgID1_%(id)s.%(ext)s'    "$*"      ##--II-single-songs-DW
##--II-single-songs:  	-o  '%(artist)s---%(title)s/%(artist)s---%(title)s__tgID1_%(id)s.%(ext)s'
##--PL-/namings:
	#_  -o  "%(artist)s---%(title)s${locFN1Prefix}__tgID1_%(id)s.%(ext)s"
	#_  -o  '%(artist)s---%(title)s/%(artist)s---%(title)s__tgID1_%(id)s__No%(track)s__tgGr%(genre)s__Y%(release_year)s.%(ext)s'   "$*"
##-- youtube-dl  -f 'bestaudio,worstvideo'  --audio-quality 0
##-- youtube-dl  -f 'bestaudio[format="opus"]/bestaudio/best'  --audio-format mp3  --audio-quality 0 --write-description --write-info-json  -wc  --no-color  --restrict-filenames  --geo-bypass  -o  '%(title)s__1genre_%(genre)s__1release_year%(release_year)s__1id_%(id)s.%(ext)s'   https://music.youtube.com/watch?v=ORrFJ63nlcA
##-- more params for MPs/lines:  
##--extracting-container-dw:  --extract-audio  --audio-quality 0  \
##-----------------------------------------------------
exit 3

################################ dnts-youtube-dl-coll-... : ###################################################
========== dnts-youtube-dl (params to take, ...)!!:
-!! DIFF: between org-downloaded-audio-file (usu. opus in webm)  <--->  and the later extracted-/converted-audio-file (post-handling) by youtube-dl with ffmpeg !
- Allg:  youtube-dl  -wc  --no-color  --restrict-filenames  --geo-bypass   -o  '...'
	#In particular, the only option out of -citw that is regularly useful is -i.
	--download-archive_1kk :   /up1/w/docs_m/WPads_All/MPs_wk/mps-yt-arc1.log.txt 
-! listing all YT-org-files/formats of your URL:  youtube-dl  -F  <url1>  ##--you need here for the MPs basically only the best audio-file ! by not-paid-YT-Dw, usu. the .opus is wrapped by a .webm-container-file !
- simulation if needed:   -s  /OR  --get-url  /OR --get-filename  /OR  --get-title , --get-description , 
- Audio-direct-DW (without video-DW, wihtout need to extract the audio, if the downloaded-format/container for you ok! YT-org: usu. .opus audio-format in webm container-format ):
	-audio-clip:   -f bestaudio #(limiting the best quality of mp3-files:  --audio-format mp3 ; but NOT good! ist better to download bestaudio and then if not-mp3, then convert it to mp3 with -x ....; see below and see doc-section "FORMAT SELECTION" )
	- audio-DW-without-video-DW- of the video-clip-URl :  youtube-dl  -k -x -f bestaudio ...
- Audio-From-Video-Extraction/converting:   -f worstvideo+bestaudio  --extract-audio  --audio-format mp3  --audio-quality 320k 
	see doc-section "FORMAT SELECTION" for the qualities/filters/....
	You can also filter the video formats by putting a condition in brackets, as in -f "best[height=720]" (or -f "[filesize>10M]").
	Download the best video format and the best audio format without merging them:  youtube-dl -f 'bestvideo,bestaudio' -o '%(title)s.f%(format_id)s.%(ext)s'  ##Note, an output template is recommended as bestvideo and bestaudio may have the same file name.
	-!! DIFF: by options of -f/--format param, differentiate between "," and "/" ! so "," means both, whereas "/" means "or", so with preference from left-to-right ! see  doc-section "FORMAT SELECTION" !
- more, descriptions, lyrics,,...:  --write-description --write-info-json , --write-sub   --sub-lang LANGS  ##use --list-subs for available language tags
- 1Tip for bigger PL-DW (nicht-auffallen,...):  --sleep-interval SECONDS 
- output-filename: (see OUTPUT TEMPLATE section , and  "python string formatting operations" ...):
	see examples there in doc in "OUTPUT TEMPLATE" section !
	DIFF !!: "title" == Video-Clip-title (usu. artist-songTitle), "track" == SongTitle !!
	new DIRs can be generated/created by using "/" in the template!
	The current default template is %(title)s-%(id)s.%(ext)s
	for String-values use  "s" as in %(title)s
	for Numeric-values use "d" as in %(track_number)02d  ##--so tracknumber 2 digits prefixed with zero if needed
	for Audio-only-clips see additional section:  "Available for the media that is a track or a part of a music album:" in OUTPUT TEMPLATE section
	For example for -o %(title)s-%(id)s.%(ext)s and an mp4 video with title youtube-dl test video and id BaW_jenozKcj, this will result in a youtube-dl test video-BaW_jenozKcj.mp4 file created in the current directory.
	For numeric sequences you can use numeric related formatting, for example, %(view_count)05d will result in a string with view count padded with zeros up to 5 characters, like in 00042.
	Output templates can also contain arbitrary hierarchical path, e.g. -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' which will result in downloading each video in a directory corresponding to this path template. Any missing directory will be automatically created for you.

========== nts/params-checks/...:
##__ withe title instead artist+track (!! track is eigentlich the title-without-artistname!! , title is full-title artist+fullTitle) :
##__     youtube-dl -s  --no-color  --get-title  --get-id  --get-thumbnail  --get-duration  --get-filename  -o '%(artist)s---%(title)s/%(artist)s---%(title)s--__id_%(id)s__track_%(track)s__genre_%(genre)s__release_year%(release_year)s'   https://music.youtube.com/watch?v=2Vv-BfVoq4g

##__ filename so did not work always (were seometimes NA):  -o '%(artist)s--%(track)s/%(artist)s--%(track)s--__1title_%(title)s__1genre_%(genre)s__1release_year%(release_year)s__1id_%(id)s'   https://music.youtube.com/watch?v=ORrFJ63nlcA
##__  --get-description  --get-format 
##__  subs:  --list-subs  --all-subs   --write-auto-sub  

##----- example videos/links... to DW:
##-- https://music.youtube.com/watch?v=18g9pTqacP8
##__ video Perfect :  https://music.youtube.com/watch?v=2Vv-BfVoq4g

==========  trys/checks/tests--181215...  of youtube-dl :
d7-Surviver--Eye-of-the-tiger--videoGreat/ $ ## if -f worstvideo,bestaudio  then video and audio are NOT merged together! also ok, if only audio needed !!:
youtube-dl -k -f worstvideo+bestaudio  --keep-fragments  --geo-bypass  -wc  --audio-quality 320k --extract-audio   --audio-format mp3   --all-subs   --write-auto-sub  --write-description  --write-annotations  --write-info-json     https://music.youtube.com/watch?v=btPJPFnesV4


d2: with -k keep ...
youtube-dl -k -f worstvideo+bestaudio  --keep-fragments  --geo-bypass  -wc  --audio-quality 0 --extract-audio   --audio-format mp3     https://music.youtube.com/watch?v=ffk4rot0XF4


d1:
youtube-dl  -f worstvideo+bestaudio  --keep-fragments  --geo-bypass  -wc  --audio-quality 0 --extract-audio   --audio-format mp3     https://music.youtube.com/watch?v=ffk4rot0XF4

