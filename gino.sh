#!/bin/bash
# requires cat, wget, unzip

# available subcommands
declare -A subcommands
subcommands["help"]=1
subcommands["startapp"]=1
subcommands["startsystemapp"]=1

# help
ginohelp() {
    if [[ $1 && ${subcommands["$1"]} ]]; then
        cat ./doc/bash/help/$1.txt
    else
        if [[ $1 ]]; then
            wrong_subcommand $1
        else
            cat ./doc/bash/help/gino.txt
        fi
    fi
    exit
}

# unsupported subcommand
wrong_subcommand() {
    echo "Il subcommand $1 non è supportato."
    echo "Esegui"
    echo "  gino.sh help"
    echo "per la lista di subcommands disponibili"
}

# help subcommand
cmd_help() {
    ginohelp $2
}

# startapp subcommand
cmd_startapp() {
    if [ $# -ne 2 ]; then
        ginohelp "startapp"
    fi

    appname=$2
    echo "gino.sh, versione 0.1"
    echo ""
    echo "startapp $appname"
    echo "controllo unicità app"
    if [[ -e ./app/$appname ]]; then
        echo "Errore!"
        echo "  Esiste già un'applicazione $appname"
        exit
    fi
    echo "creo direcotry ./app/$appname"
    mkdir ./app/$appname
    echo "cd ./app/$appname"
    cd ./app/$appname
    echo "scarico seed"
    wget --quiet https://github.com/otto-torino/gino-seed/archive/master.zip
    echo "preparazione directory"
    unzip -q ./master.zip
    mv ./gino-seed-master/seedApp ./
    rm -R ./gino-seed-master
    rm ./master.zip
    mv ./seedApp/* ./
    rm -R seedApp
    echo "rinomino il controller"
    mv ./class_seedApp.php ./class_$appname.php
    echo "rinomino il file ini"
    mv ./seedApp.ini ./$appname.ini
    echo "rinomino il less"
    mv ./seedApp.less ./$appname.less
    echo "rinomino il foglio di stile"
    mv ./seedApp.css ./$appname.css
    echo "rinomino il js"
    mv ./seedApp.js ./$appname.js
    echo "replace seedApp con $appname"
    sed -i "s/SeedApp/${appname^}/g" *.*
    sed -i "s/seedApp/$appname/g" *.*
    echo "Fatto!"
    echo "Enjoy your gino development!"
    echo "gino team"

}

# startapp subcommand
cmd_startsystemapp() {
    if [ $# -ne 2 ]; then
        ginohelp "startsystemapp"
    fi

    appname=$2
    echo "gino.sh, versione 0.1"
    echo ""
    echo "startsystemapp $appname"
    echo "controllo unicità app"
    if [[ -e ./app/$appname ]]; then
        echo "Errore!"
        echo "  Esiste già un'applicazione $appname"
        exit
    fi
    echo "creo direcotry ./app/$appname"
    mkdir ./app/$appname
    echo "cd ./app/$appname"
    cd ./app/$appname
    echo "scarico seed"
    wget --quiet https://github.com/otto-torino/gino-seed/archive/master.zip
    echo "preparazione directory"
    unzip -q ./master.zip
    mv ./gino-seed-master/seedSystemApp ./
    rm -R ./gino-seed-master
    rm ./master.zip
    mv ./seedSystemApp/* ./
    rm -R seedSystemApp
    echo "rinomino il controller"
    mv ./class_seedSystemApp.php ./class_$appname.php
    echo "rinomino il file ini"
    mv ./seedSystemApp.ini ./$appname.ini
    echo "rinomino il less"
    mv ./seedSystemApp.less ./$appname.less
    echo "rinomino il foglio di stile"
    mv ./seedSystemApp.css ./$appname.css
    echo "rinomino il js"
    mv ./seedSystemApp.js ./$appname.js
    echo "replace seedSystemApp con $appname"
    sed -i "s/SeedSystemApp/${appname^}/g" *.*
    sed -i "s/seedSystemApp/$appname/g" *.*
    echo "Fatto!"
    echo "Enjoy your gino development!"
    echo "gino team"
}

# runtime

# check argument existence
if [ $# -eq 0 ]; then
    ginohelp
fi

subcmd=$1

# check command argument
if [[ ${subcommands["$subcmd"]} ]]; then
    "cmd_$subcmd" "$@"
else
    wrong_subcommand $subcmd
fi

exit

