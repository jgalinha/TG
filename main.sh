#!/usr/bin/env bash
set -euo pipefail
SWITCHBOARD_FILE="switchboardd.zip"

Switchboard(){
    echo -e "🔎 Localizando o ficheiro $SWITCHBOARD_FILE\n"
    if [ -f $SWITCHBOARD_FILE ]; then
        echo "✅ Ficheiro $SWITCHBOARD_FILE encontrado"
    else
        while :
        do
            echo -e "❌ Ficheiro não encontrado\n"
            echo "Insira o nome do ficheiro do switchboard!"
            echo "Ficheiros .zip na directoria $PWD"
            for file in ./*.zip
            do
                echo " -> ${file##*/}"
            done
            echo -e "Insira do nome do ficheiro do switchboard : "
            read ficheiro
            if [ -f $ficheiro  ]; then
                clear
                echo "✅ Ficheiro $ficheiro encontrado"
                SWITCHBOARD_FILE=$ficheiro
                break
            fi  
            clear
        done
    fi
}

echo "Bem vindo ao gerador de corpus para o Eugénio V3!"
echo "-------------------------------------------------"
Switchboard
echo $SWITCHBOARD_FILE
