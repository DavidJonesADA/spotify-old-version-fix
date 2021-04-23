#!/bin/sh
# Copyright 2021 Aunt Fanny Coding. All rights reserved.
# For Rachel


echo "********************************"
echo "Aunt Fanny Coding LLC"
echo "All rights reserved. 2021"
echo "This program is free software and distributed under the terms of the GNU"
echo "********************************"

echo " "

echo "REMOING EXISTING xpui.spa file"
rm /Applications/Spotify.app/Contents/Resources/Apps/xpui.spa

echo " "

echo "INSTALLING NEW xpui.spa file"
curl --output /tmp/spotify-old-installation/xpui.spa --create-dirs "https://raw.githubusercontent.com/DavidJonesADA/spotify-old-version-fix/main/xpui.spa"

echo " "

FILE=/tmp/spotify-old-installation/xpui.spa
if [ -f "$FILE" ]; then
    echo "$FILE exists."
    mv /tmp/spotify-old-installation/xpui.spa /Applications/Spotify.app/Contents/Resources/Apps/xpui.spa
    echo "DELETING FOLDER"
    rm -R /tmp/spotify-old-installation/
    echo "DONE!"
else 
    echo "$FILE does not exist."
fi