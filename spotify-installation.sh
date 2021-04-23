#!/bin/sh
# Copyright 2021 Aunt Fanny Coding. All rights reserved.
# For Rachel


echo "********************************"
echo "Aunt Fanny Coding LLC"
echo "All rights reserved. 2021"
echo "This program is free software and distributed under the terms of the GNU"
echo "********************************"

echo " "

echo "DELETING SPICETIFY FILES"
if [ -f "$PWD/spicetify-cli/test" ]; then
    echo "/spicetify-cli/ exists. Deleting..."
    rm -R -v $PWD/spicetify-cli/test
    echo "DELETED"
if [ -f "$PWD/spicetify_data/test" ]; then
    echo "/spicetify_data/ exists. Deleting..."
    rm -R -v $PWD/spicetify_data/test
    echo "DELETED"

echo "INSTALLING NEW pref FILE"
sed -i'.bak' '/ui\.\experience_override="xpui"/c\' $PWD/Documents/test/prefs
echo 'ui.experience_override="classic"' >> $PWD/Documents/test/prefs


echo "Done!"