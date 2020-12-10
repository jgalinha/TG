#!/usr/bin/env bash
# Autores: José Galinha, Luis Adriano
# Main script para utilização no trabalho de grupo 1 da disciplina SO
# 
set -euo pipefail

# Variável que define o nome do ficheiro a localizar por defeitos
SWITCHBOARD_FILE="switchboard.zip"
# Variável que define quais são as pastas necessárias para o funcionamento do 
DIRS=("scripts" "corpus" "corpus_txt" "corpus_info" "words_dic" "sentences_dic")
FILE_LOCATED=false
DIR_STRUCT_OK=false
SCRIPT="scripts/criar_ficheiros.sh" # script usado para criar os vários ficheiro de texto
CORPUS_TXT='corpus_txt/switchboard.txt'
LIMIT=250000 # Limite de linhas na criação dos ficheiros
feeling="sleep 0.5"

# Função que procura o ficheiro do switchboard e se não encontrar solicita a sua
# localização
SwitchBoard(){
    echo "🔎 Localizando o ficheiro $SWITCHBOARD_FILE"
    $feeling
    if [ -f $SWITCHBOARD_FILE ]; then # Verifica se o fich. se encontra na dir
        echo -e "✅ Ficheiro $SWITCHBOARD_FILE encontrado\n"
        FILE_LOCATED=true
    else
        while :
        do
            echo -e "❌ Ficheiro não encontrado\n"
            echo "Insira o nome do ficheiro do switchboard!"
            echo "Ficheiros .zip na directoria $PWD"
            for file in ./*.zip # mostra todos os fich. disp. na dir.
            do
                echo " -> ${file##*/}"
            done
            echo -e "Insira a localização do ficheiro do switchboard : "
            read ficheiro
            if [ -f $ficheiro  ]; then # verifica se o fich. existe
                clear
                echo -e "✅ Ficheiro $ficheiro encontrado\n"
                SWITCHBOARD_FILE=$ficheiro
                FILE_LOCATED=true
                break
            fi  
            clear # limpa a consola
        done
    fi
}

# Função para verificar se existe a estrutura de dir. a usar procura uma a uma
# caso não existam cria as mesmas
CheckFolderStructure(){
    echo -e "\n🛠  Incializando a verificação da estrutura de diretorias\n"
    $feeling
    for dir in ${DIRS[@]};
    do
        echo -n "🔎  Verificando a existência da diretoria '$dir'"
        if [ -d $dir ]; then
            $feeling
            echo " ✅"
        else
            echo " ❌"
            echo -n "    📂 diretoria inexistente criando diretoria '$dir'"
            $feeling
            mkdir $dir
            [[ $? -eq 0 ]] && echo " ✅" || echo " ❎"
        fi
    done
    echo -e "Diretorias 🆗\n"
    DIR_STRUCT_OK=true
}

# Função para carregar os scripts
Carregar_Script() {
    clear
    if [ -f $1 ]; then
        source $1 ${2:-""} ${3:-""}
    else
        echo -e "❌ ficheiro '$1 não localizado\n"
        # todo realizar o download do ficheiro quando não encontrado (git?)
        echo -en "\npressione qualquer tecla para voltar ao menu anterior!"
        read -n 1
    fi
}

while true; do
    clear >$(tty)
    echo "Bem vindo ao gerador de corpus para o Eugénio V3!"
    echo "-------------------------------------------------"
    if ! $DIR_STRUCT_OK; then
        CheckFolderStructure
    else
        echo "Diretorias 🆗"
    fi
    if ! $FILE_LOCATED; then
        SwitchBoard
    else
        echo -e "Ficheiro do switchboard 🆗 \n"
    fi
    echo "Escolha a opção pretendida"
    echo "--------------------------"
    echo " 0 - sair"
    echo " 1 - descompactar o switchboard"
    echo " 2 - caracterizar o corpus utilizado (corpus_info.txt)"
    echo " 3 - criar ficheiro de palavras (words.txt)"
    echo " 4 - criar ficheiro de pares palavras (words_pairs.txt)"
    echo " 5 - criar ficheiro de frases (sentences.txt)"
    echo " 6 - criar ficheiro de pares de frases (sentences_pairs.txt)"
    echo " "
    read -p " -> " option
    case $option in
        0) break ;;
        1) Carregar_Script "scripts/unzip_switchboard.sh" ;; 
        2) Carregar_Script "scripts/caracterizar_corpus.sh" ;;
        3) Carregar_Script $SCRIPT "words_table.awk" "words_dic/words.txt" ;;
        4) Carregar_Script $SCRIPT "word_pairs.awk" "words_dic/words_pairs.txt" ;;
        5) Carregar_Script $SCRIPT "unique_phrases.awk" "sentences_dic/sentences.txt" ;;
        6) Carregar_Script $SCRIPT "pair_phrases.awk" "sentences_dic/sentences_pairs.txt"
    esac
done

echo "FIM"
