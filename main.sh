#!/usr/bin/env bash
set -euo pipefail

SWITCHBOARD_FILE="switchboard.zip"
DIRS=("scripts" "corpus" "corpus_txt" "corpus_info" "words_dic" "sentences_dic")


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

CheckFolderStructure(){
    echo -e "\n🛠  Incializando a verificação da estrutura de diretorias\n"
    for dir in ${DIRS[@]};
    do
        echo -n "🔎  Verificando a existência da diretoria '$dir'"
        if [ -d $dir ]; then
            echo " ✅"
        else
            echo " ❌"
            echo "    📂 diretoria inexistente criando diretoria '$dir'"
            mkdir $dir
        fi
    done
        
}

echo "Bem vindo ao gerador de corpus para o Eugénio V3!"
echo "-------------------------------------------------"
CheckFolderStructure
