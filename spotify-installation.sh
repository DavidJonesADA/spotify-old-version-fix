#!/bin/sh
# Copyright 2021 Aunt Fanny Coding. All rights reserved.
# For Rachel


printf "\n********************************\n"
printf "Aunt Fanny Coding LLC\n"
printf "All rights reserved. 2021\n"
printf "This program is free software and distributed under the terms of the GNU\n"
printf "for rachel\n"
printf "********************************\n"

printf "\n"

pkill Spotify

printf "\e[32mWould you like to delete Spicetify? (If you have already deleted the files yourself type 2 and press enter)\n"
printf "\e[32mType '1' and press enter to DELETE spicetify\n"
printf "\e[32mType '2' and press enter to IGNORE\n\n"

read selectoption1


if [[ $selectoption1 == "1" ]]; then



    printf "\e[93mDELETING SPICETIFY FILES IF EXISTS\n"
    if [ -d "$HOME/spicetify-cli/" ]; then
        printf "/spicetify-cli/ exists. Deleting...\n"
        printf "\e[36mm"
        rm -R -v $HOME/spicetify-cli/
        printf "\e[31mDELETED\n"
    fi

    if [ -d "$HOME/spicetify_data/" ]; then
        printf "\e[93m/spicetify_data/ exists. Deleting...\n"
        printf "\e[36mm"
        rm -R -v $HOME/spicetify_data/
        printf "\e[31mDELETED\n"
    fi
fi



prefFileQuestion=$(find $HOME/'Library/Application Support/Spotify/prefs' -flags nouchg)

if [[ "${prefFileQuestion}" == *"prefs"* ]];then
    printf "\e[32mYour preference file is UNLOCKED would you like to use the old spotify?\n"
    printf "\e[32mType '1' and press enter to USE OLD SPOTIFY LAYOUT (not the shit one xxx)\n"
    printf "\e[32mType '2' and press enter to USE NEW SPOTIFY LAYOUT (the shit one xxx)\n"
    printf "\e[32mType '3' and press enter if spotify is ALREADY how you want it to look \n\n"
    read selectoption2
    if [[ $selectoption2 == "1" ]]; then
        printf "\e[32mOVERWRITING EXISTING pref FILE...\n"
        sed -i'.bak' '/ui\.\experience_override="xpui"/c\' $HOME/'Library/Application Support/Spotify/prefs'
        printf 'ui.experience_override="classic"' >> $HOME/'Library/Application Support/Spotify/prefs'
        printf "\e[32mDONE\n"
    fi
    if [[ $selectoption2 == "2" ]]; then
        printf "\e[32mOVERWRITING EXISTING pref FILE...\n"
        sed -i'.bak' '/ui\.\experience_override="classic"/c\' $HOME/'Library/Application Support/Spotify/prefs'
        printf 'ui.experience_override="xpui"' >> $HOME/'Library/Application Support/Spotify/prefs'
        printf "\e[32mDONE\n"
    fi
fi

if [[ "${prefFileQuestion}" == *"prefs"* ]];then
        printf "\e[93mYour preference files are UNLOCKED\n"
    else
        printf "\e[93mYour preference files are LOCKED\n"
fi

printf "\e[32mWould you like to LOCK or UNLOCK the preference file (locking the file will prevent spotify from changing the layout)\n"
printf "\e[32mType '1' to LOCK files\n"
printf "\e[32mType '2' to UNLOCK files\n\n"


read selectoption3



if [[ $selectoption3 == "1" ]]; then
    prefFile=$(find $HOME/'Library/Application Support/Spotify/prefs' -flags nouchg)
    if [[ "${prefFile}" == *"prefs"* ]];then
        printf "\e[93mMAIN PREF FILE UNLOCKED\n"
        printf "\e[32mLOCKING SPOTIFY PREF FILE\n"
        chflags -R uchg $HOME/'Library/Application Support/Spotify/prefs'
        printf "\e[32mDone!\n"   
    else
        printf "\e[93m MAIN PREF FILE ALREADY LOCKED! \n"
    fi

    if [ -f "$HOME/'Library/Application Support/Spotify/prefs.tmp'" ]; then
        prefbkFile=$(find $HOME/'Library/Application Support/Spotify/prefs.tmp' -flags nouchg)
        if [[ "${prefbkFile}" == *"prefs"* ]];then
            printf "\e[93mMAIN PREF FILE UNLOCKED\n"
            printf "\e[32mLOCKING SPOTIFY BACKUP PREF FILE...\n"
            chflags -R uchg $HOME/'Library/Application Support/Spotify/prefs.tmp'
            printf "\e[32mDone!\n" 
        else
            printf "\e[93m BACKUP PREF FILE ALREADY LOCKED! \n"
        fi
    fi
fi


if [[ $selectoption3 == "2" ]]; then
    prefFile=$(find $HOME/'Library/Application Support/Spotify/prefs' -flags uchg)
    
    if [[ "${prefFile}" == *"prefs"* ]];then
        printf "\e[93mMAIN PREF FILE LOCKED\n"
        printf "\e[32mUNLOCKING SPOTIFY PREF FILE\n"
        chflags -R nouchg $HOME/'Library/Application Support/Spotify/prefs'
        printf "\e[32mDone!\n"   
    else
        printf "\e[93m MAIN PREF FILE ALREADY UNLOCKED! \n"
    fi

    if [ -f "$HOME/'Library/Application Support/Spotify/prefs.tmp'" ]; then
        prefbkFile=$(find $HOME/'Library/Application Support/Spotify/prefs.tmp' -flags uchg)
        if [[ "${prefbkFile}" == *"prefs"* ]];then
            printf "\e[93mMAIN PREF FILE LOCKED\n"
            printf "\e[32mUNLOCKING SPOTIFY PREF FILE\n"
            chflags -R nouchg $HOME/'Library/Application Support/Spotify/prefs.tmp'
            printf "\e[32mDone!\n"   
        else
            printf "\e[93m BACKUP PREF FILE ALREADY UNLOCKED! \n"
        fi
    fi
fi



open /Applications/Spotify.app



printf "\e[92mComplete!\n"
