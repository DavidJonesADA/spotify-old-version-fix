#!/bin/sh
# Copyright 2021 Aunt Fanny Coding. All rights reserved.
# For Rachel


echo "********************************"
echo "Aunt Fanny Coding LLC"
echo "All rights reserved. 2021"
echo "This program is free software and distributed under the terms of the GNU"
echo "********************************"

echo " "
echo " "
echo " "

echo "REMOING EXISTING xpui.spa file"
rm /Applications/Spotify.app/Contents/Resources/Apps/xpui.spa

echo "INSTALLING NEW xpui.spa file"
curl --output-dir /Applications/Spotify.app/Contents/Resources/Apps "https://github.com/DavidJonesADA/spotify-old-version-fix/raw/main/xpui.spa"

FILE=/Applications/Spotify.app/Contents/Resources/Apps/xpui.spa
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    echo "$FILE does not exist."
fi