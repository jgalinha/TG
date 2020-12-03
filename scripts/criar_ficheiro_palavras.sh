#!/usr/bin/env bash
# Autores: José Galinha, Luis Adriano
#
# TODO Comantários
# 
set -euo pipefail

WT="scripts/words_table.awk"
control=true
OUTPUT_FILE="words_dic/words.txt"


# verifica a existência do prog. nawk, em alternativa usa o awk
[[ $(command -v nawk) ]] && cmd="nawk" || cmd="awk"
if [ ! -f $WT ]; then
    echo "❎ O ficheiro '$WT' não foi encontrado, o programa não pode continuar" 
    control=false
fi

if $control; then
    echo -e "Criando o ficheiro de palavras ... 📝\n"
    cat $CORPUS_TXT | $cmd -f $WT | sort -k 1 > $OUTPUT_FILE
    [[ $? -eq 0 ]] && echo "Ficheiro '$OUTPUT_FILE' criado com sucesso ✅" || echo "Erro na criação do ficheiro ❌"


fi

echo -en "\nPressione qualquer tecla para voltar ao menu anterior!"
read -n 1
