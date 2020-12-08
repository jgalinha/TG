#!/usr/bin/awk
###############################################################################
#                               pair_phrases.awk                              #
#                       Autores: José Galinha, Luis Adriano                   #
###############################################################################

BEGIN{
    # Delimitadores de frases
    RS="[\n\t!?,:;..{3}]+";   
    frase = ""
    counter = 0
}

{
    # Vamos eliminar todos os espaços brancos no inicio das linhas com o gsub
    gsub(/^[[:blank:]]+/,"",$0)
    if (NF > 0){
        #  ciclo for para substituir os espaços na frase
        gsub(/[[:blank:]]+/,"|",$0)
        if (counter == 0){
            par = $0
            counter = 1
        } else {
            par = tolower(par " " $0)
            if (par in tabela) {
                tabela[par] ++
            } else {
                tabela[par] = 1
            }
            par = $0
        }
    }
}

END{
    for (frase in tabela)
        print frase, tabela[frase]
}
