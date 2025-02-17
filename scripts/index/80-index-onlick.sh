#!/bin/sh

set -eu

TITLE="${TITLE:-"Rickroll"}"
POSTER="${POSTER:-"download.jpg"}"
HEIGHT="${HEIGHT:-"100vh"}"
WIDTH="${WIDTH:-"100%"}"
HEADLINE="${HEADLINE:-""}"

#Create index.html
tee /usr/share/nginx/html/index.html << EOF >/dev/null
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>$TITLE</title>
</head>
<body>
$HEADLINE
<div style="text-align: center;">
  <video width="$WIDTH" loop poster="$POSTER" onclick="if (typeof InstallTrigger == 'undefined') (this.paused ? this.play() : this.pause());">
    <source src="rickroll.mp4" type="video/mp4">
  </video>
<style>
    video {
        height: $HEIGHT;
        width: $WIDTH;
        object-fit: cover; /**/ use "cover" to avoid distortion
        position: absolute;
    }
</style>
</div>
</html>
EOF

echo ""
echo "#####################"
echo "Website title is: $TITLE"
echo "Website height: $HEIGHT"
echo "Website width: $WIDTH"
echo "Headline is: $HEADLINE"
echo "#####################"
echo ""

exec "$@"
