#!/bin/sh

# Feed script a url or file location.
# If an image, it will view in sxiv,
# if a video or gif, it will view in mpv
# if a music file or pdf, it will download,
# otherwise it opens link in browser.

browser="lynx"        # $BROWSER, lynx, w3m

[ -z "$1" ] && { "$browser"; exit; }    # if no url given, opens browser

case "$1" in
	*mkv|*webm|*mp4|*youtube.com/watch*|*youtube.com/playlist*|*youtu.be*|*hooktube.com*|*bitchute.com*|*videos.lukesmith.xyz*|*odysee.com*)
		setsid -f mpv -quiet "$1" >/dev/null 2>&1 ;;
	*png|*jpg|*jpe|*jpeg|*gif)
		curl -sL "$1" > "/tmp/$(echo "$1" | sed "s/.*\///;s/%20/ /g")" && sxiv -a "/tmp/$(echo "$1" | sed "s/.*\///;s/%20/ /g")"  >/dev/null 2>&1 & ;;
	*pdf|*cbz|*cbr)
		curl -sL "$1" > "/tmp/$(echo "$1" | sed "s/.*\///;s/%20/ /g")" && zathura "/tmp/$(echo "$1" | sed "s/.*\///;s/%20/ /g")"  >/dev/null 2>&1 & ;;
	*mp3|*flac|*opus|*mp3?source*)
		qndl "$1" 'curl -LO'  >/dev/null 2>&1 ;;
	*)
		[ -f "$1" ] && ${TERMINAL} -e "$EDITOR" "$1" >/dev/null 2>&1 || ${browser} "$1" 2>&1
    # setsid -f et >/dev/null fait complètement bugger tmux ou st
		# [ -f "$1" ] && { setsid -f "$TERMINAL" -e "$EDITOR" "$1" >/dev/null 2>&1 || setsid -f "$browser" "$1" >/dev/null 2>&1
esac
