#!/usr/bin/awk
###############################################################################
#                               pair_phrases.awk                              #
# Autores: José Galinha, Luis Adriano #########################################
# Ficheiro para contar o numero de pares de frases num ficheiro de texto ######
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
        # Comando gsub para substituir todos os espaços por '|''
        gsub(/[[:blank:]]+/,"|",$0)
        if (counter == 0){
            par = $0
            counter = 1
        } else {
            # Construção do par
            par = tolower(par " " $0)
            # Verificação se o par já existe na tabela, se não existir inicia a 1
            if (par in tabela) {
                tabela[par] ++
            } else {
                tabela[par] = 1
            }
            # Igual o par a ultima frase para a combinar com a próxima
            par = $0
        }
    }
}

END{
    # Impressão dos resultados obtidos
    for (frase in tabela)
        print frase, tabela[frase]
}
