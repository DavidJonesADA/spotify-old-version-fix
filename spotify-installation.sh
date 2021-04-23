#!/bin/sh
# Copyright 2021 Aunt Fanny Coding. All rights reserved.
# For Rachel


printf "\n********************************\n"
printf "Aunt Fanny Coding LLC\n"
printf "All rights reserved. 2021\n"
printf "This program is free software and distributed under the terms of the GNU\n"
printf "********************************\n"

printf "\n"

pkill Spotify

printf "\e[93mDELETING SPICETIFY FILES IF EXISTS\n"
if [ -d "$PWD/spicetify-cli/test" ]; then
    printf "/spicetify-cli/ exists. Deleting...\n"
    printf "\e[36mm"
    rm -R -v $PWD/spicetify-cli/test
    printf "\e[31mDELETED\n"
fi

if [ -d "$PWD/spicetify_data/test" ]; then
    printf "\e[93m/spicetify_data/ exists. Deleting...\n"
    printf "\e[36mm"
    rm -R -v $PWD/spicetify_data/test
    printf "\e[31mDELETED\n"
fi

printf "\e[32mOVERWRITING EXISTING pref FILE...\n"
sed -i'.bak' '/ui\.\experience_override="xpui"/c\' $PWD/'Library/Application Support/Spotify/prefs'
printf 'ui.experience_override="classic"' >> $PWD/'Library/Application Support/Spotify/prefs'
printf "\e[32mDONE\n"

printf "\e[92mComplete!\n"

open /Applications/Spotify.app