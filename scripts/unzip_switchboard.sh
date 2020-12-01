#!/usr/bin/env bash
set -euo pipefail

echo -e "Iniciando descompactação do ficheiro $SWITCHBOARD_FILE 🗜"
$felling
# comando unzip que apenas extrai os ficheiros txt do arquivo
# https://unix.stackexchange.com/questions/59276/how-to-extract-only-a-specific-folder-from-a-zipped-archive-to-a-given-directory
unzip -uqj $SWITCHBOARD_FILE "switchboard/*.txt" -d corpus 
$felling

if [ $? -eq 0 ]; then # verifica se o comando unzip concluiu com sucesso
    echo "Ficheiros extraidos com sucesso ✅" 
    echo -n "Juntanto todos os ficheiros de texto num só 💤 ..."
    # verificar se o fich. output já existe, se existir apaga-o
    [[ -f output ]] && rm output 
    # percorre todos os ficheiros txt da pasta corpus e junta-os num fich. temp.
    for i in corpus/*.txt; do
        cat $i >> corpus/output
    done
    echo " ✅ ficheiro criado com sucesso"
    echo -n "Movendo o ficheiro para a diretoria 'corpus_txt'"
    $felling
    # verifica se o ficheiro já existe, se existir apaga-o
    [[ -f corpus_txt/switchboard.txt ]] && rm corpus_txt/switchboard.txt
    mv corpus/output corpus_txt/switchboard.txt
    $felling
    # verifica se o comando mv teve sucesso, e mostra o output correspondente
    [[ $? -eq 0 ]] && echo " ✅" || echo " ❎"
    echo "📄 Ficheiro criado em 'corpus_txt/switchboard.txt'"
else
    echo "A extaação dos ficheiros terminou com erros ❎"
fi

echo -en "\nPressione qualquer tecla para voltar ao menu anterior!"
read -n 1

