#!/usr/bin/env bash
# Autores: José Galinha, Luis Adriano
#
# 
set -euo pipefail

WT="scripts/unique_phrases.awk"
OUTPUT_FILE="sentences_dic/sentences.txt"


# verifica a existência do prog. nawk, em alternativa usa o awk
[[ $(command -v nawk) ]] && cmd="nawk" || cmd="awk"
# Verifica se o script awk existe
if [ ! -f $WT ]; then
    echo "❎ O ficheiro '$WT' não foi encontrado, o programa não pode continuar" 
else
    echo -e "Criando o ficheiro de frases ... 📝\n"
    # Criação do ficheiro de criação de palavras
    cat $CORPUS_TXT | $cmd -f $WT | sort -k 1 > $OUTPUT_FILE
    # Verifica se o comando anterior foi concluido com sucesso
    [[ $? -eq 0 ]] && echo "Ficheiro '$OUTPUT_FILE' criado com sucesso ✅" || echo "Erro na criação do ficheiro ❌"
fi

echo -en "\nPressione qualquer tecla para voltar ao menu anterior!"
read -n 1
