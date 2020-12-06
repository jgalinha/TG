#!/usr/bin/env bash
###############################################################################
#                        criar_ficheiro_par_palavras.sh                       #
# Autores: José Galinha, Luis Adriano ######################################### 
###############################################################################
#
# 
set -euo pipefail

WT="scripts/word_pairs.awk" # ficheiro awk com script de contagem de pares
OUTPUT_FILE="words_dic/words_pairs.txt" # ficheiro de desstino dos pares


# verifica a existência do prog. nawk, em alternativa usa o awk
[[ $(command -v nawk) ]] && cmd="nawk" || cmd="awk"
# Verifica se o ficheiro awk existe
if [ ! -f $WT ]; then
    echo "❎ O ficheiro '$WT' não foi encontrado, o programa não pode continuar" 
else
    echo -e "Criando o ficheiro de pares de palavras ... 📝\n"
    # Operação de criação do ficheiro de pares de palavras
    cat $CORPUS_TXT | $cmd -f $WT | sort -k 1 > $OUTPUT_FILE
    # Verifica se a operação anterior termino com sucesso
    [[ $? -eq 0 ]] && echo "Ficheiro '$OUTPUT_FILE' criado com sucesso ✅" || echo "Erro na criação do ficheiro ❌"
fi

echo -en "\nPressione qualquer tecla para voltar ao menu anterior!"
read -n 1
 
