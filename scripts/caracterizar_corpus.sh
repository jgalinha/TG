#!/usr/bin/env bash
# Autores: José Galinha, Luis Adriano
#
# TODO Comantários
# 
set -euo pipefail

CUW="scripts/count_unique_words.awk"
CW="scripts/count_words.awk"
CP="scripts/count_phrases.awk"
CUP="scripts/count_unique_phrases.awk"
control=true
OUTPUT_FILE="corpus_info/corpus_info.txt"


# verifica a existência do prog. nawk, em alternativa usa o awk
[[ $(command -v nawk) ]] && cmd="nawk" || cmd="awk"
if [ ! -f $CUW ]; then
    echo "❎ O ficheiro '$CUW' não foi encontrado, o programa não pode continuar"  
    control=false
fi

if [ ! -f $CW ]; then
    echo "❎ O ficheiro '$CW' não foi encontrado, o programa não pode continuar"  
    control=false
fi

if [ ! -f $CP ]; then
    echo "❎ O ficheiro '$CP' não foi encontrado, o programa não pode continuar"  
    control=false
fi
if [ ! -f $CUP ]; then
    echo "❎ O ficheiro '$CUP' não foi encontrado, o programa não pode continuar"  
    control=false
fi
if $control; then
    echo -e "Caracterizando o corpus... 📃\n"
    number_of_chars=$(wc -m $CORPUS_TXT | $cmd '{print $1}')
    number_of_non_empty_lines=$(sed '/^\s*$/d' $CORPUS_TXT | wc -l)
    unique_words=$(cat $CORPUS_TXT | $cmd -f $CUW )
    words=$(cat $CORPUS_TXT | $cmd -f $CW)
    quociente_palavras=$(awk "BEGIN{print ($unique_words * 100) / $words}")
    phrases=$(cat $CORPUS_TXT | $cmd -f $CP)
    unique_phrases=$(cat $CORPUS_TXT | $cmd -f $CUP)
    quociente_frases=$(awk "BEGIN{print ($unique_phrases * 100_) / $phrases}")
    
    echo "Número de caracteres: $number_of_chars" > $OUTPUT_FILE
    echo "Número de linhas não vazias: $number_of_non_empty_lines" >> $OUTPUT_FILE
    echo "Número de palavras: $words" >> $OUTPUT_FILE
    echo "Numero de palavras diferentes: $unique_words" >> $OUTPUT_FILE
    echo "Apenas $quociente_palavras% das palavras são unicas" >> $OUTPUT_FILE
    echo "Número de frases: $phrases" >> $OUTPUT_FILE
    echo "Número de frases únicas $unique_phrases" >> $OUTPUT_FILE
    echo "$quociente_frases% das frases são únicas" >> $OUTPUT_FILE
    # https://www.shell-tips.com/bash/math-arithmetic-calculation/
    # printf %.2f%% "$((10**3 * 100 * $unique_words / $words))e-3"
    cat $OUTPUT_FILE

fi

echo -en "\nPressione qualquer tecla para voltar ao menu anterior!"
read -n 1
